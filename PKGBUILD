# Maintainer: dressedinblack5 <dressedinblack5@proton.me>
pkgname=attack-shark-x11-electron
pkgver=1.4.2
pkgrel=1
pkgdesc="Cross-platform driver for the Attack Shark X11 gaming mouse with Electron GUI"
arch=('x86_64')
url="https://github.com/dressedinblack5/attack-shark-x11-electron"
license=('MIT')
depends=('electron' 'libusb')
makedepends=('bun' 'rust')
options=('!strip')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a32cec5ee1d457e43b3a732fea0e7daae03c5bf6fea73b052e70639774b20ffd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  bun install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  bun run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r out/* "$pkgdir/usr/lib/$pkgname/"

  # Strip devDeps and the bundled electron (system electron is the runtime dep)
  bun install --production
  rm -rf node_modules/electron
  cp -a node_modules "$pkgdir/usr/lib/$pkgname/"
  cp package.json "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/attack-shark-x11-electron"
  echo 'exec electron /usr/lib/attack-shark-x11-electron/main/index.js "$@"' >> "$pkgdir/usr/bin/attack-shark-x11-electron"
  chmod +x "$pkgdir/usr/bin/attack-shark-x11-electron"

  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/attack-shark-x11-electron.desktop" "$pkgdir/usr/share/applications/attack-shark-x11-electron.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/assets/attack-shark-x11.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/attack-shark-x11.svg"
}
