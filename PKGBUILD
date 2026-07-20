# Maintainer: lhl <lhl@randomfoo.net>

pkgname=amdtop
pkgver=0.2.5
pkgrel=1
pkgdesc='A btop/nvitop-style system monitor for AMD GPUs, CPUs, and XDNA NPUs'
arch=('x86_64')
url='https://github.com/lhl/amdtop'
license=('Apache-2.0')
depends=('glibc' 'libdrm' 'libgcc')
makedepends=('cargo')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
)
b2sums=('6d1560d38c439b80719e3f78451e2bdc92758f66bae39365b5942d95579c52ef15fe7a5b45f740b5d5e7889f7ba52bd6f20381a740f3099e530bd724d7de522a')

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
  install -Dm0644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  install -Dm0644 THIRD_PARTY.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY.md"
}
