# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=didyoumean
pkgver=1.1.1
pkgrel=1
pkgdesc="A CLI spelling corrector"
arch=('x86_64')
url="https://github.com/hisbaan/didyoumean"
license=('GPL3')
depends=('gcc-libs' 'libxcb')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5af0579872fb63be5b4b96416db03ce93aacd302e74e96dbbdbb45283598d81e250863ad8f76c6c3277503d9ad269dd4f431ffb92e66b9eebe13c7caa274a02b')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/dym" -t "$pkgdir/usr/bin"
  install -Dm 644 docs/README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
