# Maintainer: artym
# Arch App Center - A modern graphical package manager for Arch Linux
# Built with Electron, supports pacman and AUR packages
pkgname=arch-app-center
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern graphical package manager for Arch Linux with pacman and AUR support"
arch=('x86_64')
url="https://github.com/artym/arch-app-center"
license=('MIT')
depends=('electron' 'pacman' 'yay')
makedepends=('npm' 'nodejs' 'typescript')
# Use git source for local development
source=("git+file://${PWD}#commit=$(git rev-parse HEAD 2>/dev/null || echo HEAD)")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Arch-App-Center"
  # Install npm dependencies
  npm install
  # Build TypeScript to JavaScript
  npm run build
  # Create AppImage distribution
  npm run dist
}

package() {
  cd "$srcdir/Arch-App-Center"
  
  # Create necessary directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/64x64/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/16x16/apps"
  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  
  # Copy application files from electron-builder output
  cp -r dist/linux-unpacked/* "$pkgdir/usr/lib/$pkgname/"
  
  # Create executable script
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec /usr/lib/$pkgname/$pkgname "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
  
  # Create .desktop file for menu integration
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Arch App Center
Comment=A modern graphical package manager for Arch Linux
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=System;PackageManager;
Keywords=arch;linux;package;manager;pacman;aur;
EOF
  
  # Install icons in various sizes for different use cases
  if [ -f "public/icons/arch-app-center-256.png" ]; then
    install -Dm644 "public/icons/arch-app-center-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  fi
  
  if [ -f "public/icons/arch-app-center-128.png" ]; then
    install -Dm644 "public/icons/arch-app-center-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  fi
  
  if [ -f "public/icons/arch-app-center-64.png" ]; then
    install -Dm644 "public/icons/arch-app-center-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  fi
  
  if [ -f "public/icons/arch-app-center-32.png" ]; then
    install -Dm644 "public/icons/arch-app-center-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  fi
  
  if [ -f "public/icons/arch-app-center-16.png" ]; then
    install -Dm644 "public/icons/arch-app-center-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  fi
  
  # Install scalable SVG icon
  if [ -f "public/icons/arch-app-center.svg" ]; then
    install -Dm644 "public/icons/arch-app-center.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  fi
  
  # Install license file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
