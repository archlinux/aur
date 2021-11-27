# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=arti
pkgver=0.0.1
pkgrel=1
pkgdesc="An implementation of Tor in Rust"
arch=('x86_64')
url="https://gitlab.torproject.org/tpo/core/arti"
license=('MIT' 'Apache')
depends=('sqlite' 'openssl' 'xz')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgname-v$pkgver/$pkgname-$pkgname-v$pkgver.tar.gz")
sha256sums=('a35f53f056220818d0f8ce82f1640e81106a1fdab4170e583abebad320f68ad5')

prepare() {
  mv "$pkgname-$pkgname-v$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  sed -n '/This code/,/ conditions./p' README.md > LICENSE
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
