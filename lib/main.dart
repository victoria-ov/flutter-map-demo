//Working example
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_map Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF8dea88),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const lat = -25.971254746017813;
    const lon = 27.990920580345126;
    const latDiff = 0.015;
    const lonDiff = 0.015;
    
    return Scaffold(
      body: FlutterMap(    
        mapController: MapController(),
        options: MapOptions(
          initialCenter: const LatLng(lat, lon),
          initialZoom: 15,
          minZoom: 14.5,
          maxZoom: 20,
          cameraConstraint: CameraConstraint.containCenter(
            bounds: LatLngBounds(
              const LatLng(lat - latDiff, lon - lonDiff),
              const LatLng(lat + latDiff, lon + lonDiff),
            ),
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'http://localhost:8080/styles/offline-style/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
        ],
      ),
    );
  }
}
