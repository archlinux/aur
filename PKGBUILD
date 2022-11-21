# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-patch
pkgver=0.2.9
pkgrel=1
pkgdesc="Cargo subcommand for patching dependencies using patch files"
arch=('x86_64')
url="https://github.com/mettke/cargo-patch"
license=('MIT')
depends=('curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('effcf1dc0a58118e05ab3c65c91a9ce5c666b8ec7ce6a41fa1709b0127f3db9a60b67e96c5c40ca06f1fc6df277c9b0c13565bf1a7d3b3c9b780cb269198c5b4')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
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
