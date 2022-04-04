# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=arti
pkgver=0.2.0
pkgrel=1
pkgdesc="An implementation of Tor in Rust"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/core/arti"
license=('MIT' 'Apache')
depends=('sqlite' 'openssl' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgname-v$pkgver/$pkgname-$pkgname-v$pkgver.tar.gz")
sha256sums=('d3639bc58c5522059c217e6dee8fcfbd63a38cdc3a6701cd9460b8f7985ce71b')
options=('!lto')

prepare() {
  mv "$pkgname-$pkgname-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
