# Maintainer: lhl <lhl@randomfoo.net>

pkgname=amdtop
pkgver=0.2.4
pkgrel=1
pkgdesc='A btop/nvitop-style system monitor for AMD GPUs, CPUs, and XDNA NPUs'
arch=('x86_64')
url='https://github.com/lhl/amdtop'
license=('MIT')
depends=('glibc' 'libdrm' 'libgcc')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)
b2sums=('ef78422af008d6d57a2518e279e9a31e227aad8265ca3d1290f21e9bb2187c76209aa04e19094e2f35c2def2eb4e7958f576302b1657ce0b4c888740c285331d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --all-targets --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
