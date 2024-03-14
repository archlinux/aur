# Maintainer: Michael Herold <arch@michaeljherold.com>

pkgname=shadowenv
pkgver=2.1.1
pkgrel=2
pkgdesc='reversible directory-local environment variable manipulations'
url='https://shopify.github.io/shadowenv'
arch=('x86_64')
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Shopify/$pkgname/archive/$pkgver.tar.gz"
  "0001-Patch-shadowenv-version-to-v2.1.1.patch"
)
makedepends=('cargo')
b2sums=(
  '35ac2b17f870838e2b0b9f1d76434c836193ce99ee31da40ccadd8d5c2f5f381ce3cd5e143ad47c858fb0e1ae033d613fe0e7106579132272aa8c152b00f85e8'
  '709d6e83f18afc6aabbb1d80856cad87cfccf268512802fdd5e35973738cb590d89dc3977b626789a4a75024341ab92285197ea240d098ed3e842f2e083239ad'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ../0001-Patch-shadowenv-version-to-v2.1.1.patch

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "man/man1/$pkgname.1"
  install -Dm0644 -t "$pkgdir/usr/share/man/man5/" "man/man5/shadowlisp.5"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
