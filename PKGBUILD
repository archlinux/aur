# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=cargo-patch
pkgver=0.2.0
pkgrel=1
pkgdesc="Cargo subcommand for patching dependencies using patch files"
arch=('x86_64')
url="https://github.com/mettke/cargo-patch"
license=('MIT')
depends=('curl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('07bdf9b149a8083161770978fec325a68c2274f5910abbd169329cc3b2228a5e150f2b74bf8e4f5d27dcce1663cf7c5c33bd34c4680ca5edd0290b8da17665dc')

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
