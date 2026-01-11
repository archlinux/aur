# Maintainer: Košava <kosava@gmail.com>
pkgname=traywave
pkgver=0.1.3
pkgrel=1
pkgdesc="Radio player with system tray notifications"
arch=('any')
url="https://github.com/Kosava/TrayWave"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-pillow'
    'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/TrayWave-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/TrayWave-$pkgver"
  
  echo "========================================"
  echo "Building TrayWave v$pkgver"
  echo "========================================"
  
  # Install Python package (includes icons in site-packages)
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  # Find where Python installed the package
  _pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
  _sitepkg="$pkgdir/usr/lib/python${_pyver}/site-packages"
  
  echo "Python site-packages: $_sitepkg"
  
  # Install icons to ADDITIONAL system locations for compatibility
  echo "Installing icons to system locations..."
  
  # 1. System traywave directory
  install -d "$pkgdir/usr/share/traywave/icons"
  
  # 2. Hicolor icon theme
  install -d "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  
  # Copy icons from source (not from wheel)
  if [ -d "resources/icons" ]; then
    for icon in resources/icons/*.png; do
      if [ -f "$icon" ]; then
        icon_name=$(basename "$icon")
        echo "  Installing PNG: $icon_name"
        
        # Install to traywave directory
        install -Dm644 "$icon" "$pkgdir/usr/share/traywave/icons/$icon_name"
        
        # Install to hicolor theme
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$icon_name"
      fi
    done
    
    # Copy SVG icons
    for icon in resources/icons/*.svg; do
      if [ -f "$icon" ]; then
        icon_name=$(basename "$icon")
        echo "  Installing SVG: $icon_name"
        
        # Install to traywave directory
        install -Dm644 "$icon" "$pkgdir/usr/share/traywave/icons/$icon_name"
        
        # Install to hicolor scalable
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$icon_name"
      fi
    done
  fi
  
  # Verify that icons are in the Python package
  if [ -d "$_sitepkg/traywave/resources/icons" ]; then
    echo "✓ Icons found in Python package"
    ls -la "$_sitepkg/traywave/resources/icons/"
  else
    echo "⚠ WARNING: Icons NOT found in Python package!"
  fi
  
  # Install desktop file
  if [ -f "packaging/traywave.desktop" ]; then
    install -Dm644 packaging/traywave.desktop "$pkgdir/usr/share/applications/traywave.desktop"
  fi
  
  # Install license if exists
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  
  echo "========================================"
  echo "Installation complete!"
  echo "Icons installed to:"
  echo "  - $_sitepkg/traywave/resources/icons/"
  echo "  - /usr/share/traywave/icons/"
  echo "  - /usr/share/icons/hicolor/"
  echo "Run: traywave"
  echo "========================================"
}
