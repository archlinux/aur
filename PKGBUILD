# Maintainer: Michael Herold <arch@michaeljherold.com>

pkgname=shadowenv
pkgver=2.0.5
pkgrel=1
pkgdesc='reversible directory-local environment variable manipulations'
url='https://shopify.github.io/shadowenv'
arch=('x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Shopify/$pkgname/archive/$pkgver.tar.gz")
depends=('cargo')
b2sums=('9dc870cdada9491f714142ab2d84827bbb54afb3b6b7063203770d7406a6c2dabb8eebd13ea35f084ac886c0684d636393f1b46a1d1c6b0ad09832aba021338d')

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
