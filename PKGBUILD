pkgname=angle-grinder
pkgver=0.17.0
pkgrel=1
pkgdesc="Slice and dice logs on the command line"
arch=('x86_64')
url="https://github.com/rcoh/angle-grinder"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rcoh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5a2054ba9eb5fcee1fef2d5fbbf1735e71bc563fc7b273890097f63297e64bf4')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --message-format=json-render-diagnostics |
  jq -r 'select(.out_dir) | select(.package_id | startswith("ag")) | .out_dir' > out_dir
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/agrind" "$pkgdir/usr/bin/agrind"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

}
