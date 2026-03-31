# Maintainer: drpt78 <drpt78@github>
pkgname=joy-browser
pkgver=0.1.0
pkgrel=1
pkgdesc="A custom Electron-based web browser for Linux"
arch=('x86_64')
url="https://github.com/drpt78/joy-browser"
license=('MIT')
depends=('electron')
makedepends=('npm' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/drpt78/joy-browser/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fd9bf2e1fb221a929964e6920f72346d4f2874d9025e4d907f803edff88073fc')

prepare() {
  cd "$pkgname-$pkgver"
  npm install --ignore-scripts
}

package() {
  cd "$pkgname-$pkgver"

  # Install app files
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -r src package.json node_modules \
    "$pkgdir/usr/lib/$pkgname/"

  # Launcher script
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
exec electron /usr/lib/$pkgname "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"

  # Desktop entry
  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=Joy Browser
Comment=A custom Electron-based web browser for Linux
Exec=$pkgname %U
Icon=$pkgname
Type=Application
Categories=Network;WebBrowser;
MimeType=x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=joy-browser
EOF

  # Icon
  install -Dm644 src/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
