# Maintainer: BitYoungjae <bityoungjae@github.com>
pkgname=garak
pkgver=1.4.0
pkgrel=1
pkgdesc="GTK4 MPRIS popup widget for Waybar"
arch=('x86_64' 'aarch64')
url="https://github.com/bityoungjae/garak"
license=('MIT')
depends=('gjs' 'gtk4' 'gtk4-layer-shell' 'playerctl')
makedepends=('nodejs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3596e3cd39b0ada675c98a7ee007991516ea4ab71eb7750cb75876026b8fea2')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  cd "$pkgname-$pkgver"

  # Install the main script
  install -Dm755 "bin/garak" "$pkgdir/usr/bin/garak"

  # Install the bundled JavaScript
  install -Dm644 "dist/main.js" "$pkgdir/usr/lib/$pkgname/main.js"

  # Update the bin script to point to the installed location
  sed -i 's|$SCRIPT_DIR/../dist/main.js|/usr/lib/garak/main.js|' "$pkgdir/usr/bin/garak"

  # Install config example
  install -Dm644 "config.example.json" "$pkgdir/usr/share/doc/$pkgname/config.example.json"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || true

  # Install README
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md" || true
}
