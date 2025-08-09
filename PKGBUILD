# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Xuanrui Qi <me@xuanruiqi.com>

pkgname=shadowenv
pkgver=3.4.0
pkgrel=1
pkgdesc='reversible directory-local environment variable manipulations'
url='https://shopify.github.io/shadowenv'
arch=('x86_64')
license=('MIT')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Shopify/$pkgname/archive/$pkgver.tar.gz"
)
makedepends=('cargo')
b2sums=('5ec973677e27003f2e0d72fd62809c27e77f2235253f7a74cedde160f5b2bd65b75bde8cb2eb020b110316faec95df5f2807499c719d26d3e6043059f9945b61')

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
