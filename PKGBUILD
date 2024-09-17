# Maintainer: Jan Fidra <tkmxqrd@gmail.com>
pkgname=chess-electron
pkgver=1.0.0
pkgrel=1
pkgdesc="Chess.com desktop app"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/chess-electron"
license=('ISC')
depends=('electron')
makedepends=('npm' 'nodejs')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2adcaacdd172e2f3b70e215cb48738008018716e0058abeb1e6855adb9aaf16a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --only=production --omit=dev
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Create necessary directories
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"

  # Copy application files
  cp -r {*.js,*.json,node_modules,assets} "$pkgdir/usr/lib/$pkgname/"

  # Create launcher script
  echo '#!/bin/sh' > "$pkgdir/usr/bin/$pkgname"
  echo "electron /usr/lib/$pkgname/main.js" >> "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Create .desktop file
  echo "[Desktop Entry]
Name=Chess.com Desktop
Exec=$pkgname
Icon=/usr/lib/$pkgname/assets/icon.png
Type=Application
Categories=Game;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
