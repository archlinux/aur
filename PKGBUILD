# Maintainer: Michael Herold <arch@michaeljherold.com>

pkgname=shadowenv
pkgver=3.3.1
pkgrel=1
pkgdesc='reversible directory-local environment variable manipulations'
url='https://shopify.github.io/shadowenv'
arch=('x86_64')
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Shopify/$pkgname/archive/$pkgver.tar.gz"
)
makedepends=('cargo')
b2sums=(
  'b500a3cee94d17a42db3613d0cca7bcdd69def5bf07532c178022ce8f922ac7fc111b3b5db9b8b39423f22c52bd3688f1b2d27d7f3ab0f27863fcf960a146f50'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

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
