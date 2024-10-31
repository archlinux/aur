# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-docs-rs
pkgver=0.1.13
pkgrel=1
pkgdesc="Imitate the documentation build that docs.rs would do"
arch=('x86_64')
url="https://github.com/dtolnay/cargo-docs-rs"
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "Cargo.lock")
sha512sums=('1b471c944e224b70ec2e55530a7991a40813915fcc019bab07aa0d21b67812199ad7ad8d6ab52b82a7f072ddd58a75b5ecec47c140eab891c761c92c1183e069'
            '19b20c569eb833a4e629b36abff3b8734ec11e68fbef261af2437e1861b3732cad66b7975690e1ad112e154a23f50365cb5cb6bf2133bd8f566e6d5e28c6730d')

prepare() {
  cd "$pkgname-$pkgver"
  cp "$srcdir/Cargo.lock" .
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
