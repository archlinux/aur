# Maintainer: dressedinblack5 <dressedinblack5@proton.me>
pkgname=attack-shark-x11-electron
pkgver=1.2.6
pkgrel=1
pkgdesc="Cross-platform driver for the Attack Shark X11 gaming mouse with Electron GUI"
arch=('x86_64')
url="https://github.com/dressedinblack5/attack-shark-x11-electron"
license=('MIT')
depends=('electron' 'libusb')
makedepends=('bun')
options=('!strip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_srcdir="$srcdir/$pkgname-$pkgver"

prepare() {
  cd "$_srcdir"
  bun install
}

build() {
  cd "$_srcdir"
  bun run build
}

package() {
  cd "$_srcdir"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r out/* "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp package.json "$pkgdir/usr/lib/$pkgname/"
  cd "$pkgdir/usr/lib/$pkgname"
  bun install --production

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/attack-shark-x11-electron"
  echo 'exec electron /usr/lib/attack-shark-x11-electron/main/index.js "$@"' >> "$pkgdir/usr/bin/attack-shark-x11-electron"
  chmod +x "$pkgdir/usr/bin/attack-shark-x11-electron"

  install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$_srcdir/assets/attack-shark-x11-electron.desktop" "$pkgdir/usr/share/applications/attack-shark-x11-electron.desktop"
  install -Dm644 "$_srcdir/assets/cs-mouse.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/attack-shark-x11.svg"
}
