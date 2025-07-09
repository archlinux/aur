# Maintainer: Your Name <dennnn8888@gmail.com>
pkgname=aniparser
pkgver=0.2.8
pkgrel=1
pkgdesc="AniParser Electron application"
arch=('x86_64')
url="https://github.com/Sinedka/aniparser"
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('npm' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sinedka/aniparser/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install dependencies
  npm install
  
  # Build the application
  npm run transpile:electron
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Create directories
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  
  # Copy application files
  cp -r dist-electron/ "$pkgdir/usr/lib/$pkgname/"
  cp -r dist-react/ "$pkgdir/usr/lib/$pkgname/dist-electron"
  
  # Install desktop file and icon (если иконка существует)
  if [ -f "dist-react/icon.png" ]; then
    install -Dm644 "dist-react/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  fi
  
  # Create desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" << EOF
[Desktop Entry]
Name=AniParser
Comment=AniParser Electron application
Exec=$pkgname
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;
EOF
  
  # Create launcher script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
exec electron /usr/lib/$pkgname/dist-electron/main.js "\$@"
EOF
}
