# Maintainer: Michael Herold <arch@michaeljherold.com>

pkgname=shadowenv
pkgver=2.0.7
pkgrel=2
pkgdesc='reversible directory-local environment variable manipulations'
url='https://shopify.github.io/shadowenv'
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Shopify/$pkgname/archive/$pkgver.tar.gz")
depends=('cargo')
b2sums=('d77b5de9613d7dca623b71bc80bf9cb11386ef91ad7c462d4fdd601a835af58b29f73bd0c8180a44252070c8bf0986f2d58cb71f71f0af89762ea72a85a6ae78')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ../../0001-Patch-shadowenv-version-to-v2.0.7.patch

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
