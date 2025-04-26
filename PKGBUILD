# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=2.0.1
pkgrel=1
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron>=35.1.0' 'nodejs>=20.0.0')
makedepends=('npm' 'git')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/aniparser/$pkgname-$pkgver"
  npm install
}

build() {
  cd "$srcdir/aniparser/$pkgname-$pkgver"
  npm run transpile:electron
  npm run build
}

package() {
  cd "$srcdir/aniparser/$pkgname-$pkgver"
  
  # Create directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  
  # Copy application files
  cp -r dist-electron/ "$pkgdir/usr/lib/$pkgname/"
  cp -r dist-react/ "$pkgdir/usr/lib/$pkgname/dist-electron/"
  
  # Install desktop file and icon
  install -Dm644 "public/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=AniParser
Comment=AniParser Electron application
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF
  
  # Create launcher script with debugging
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/dist-electron/main.js
EOF
  
  chmod 755 "$pkgdir/usr/bin/$pkgname"
} 