# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-wasmer
pkgver=0.4.0
pkgrel=1
pkgdesc="Cargo sub-command for publishing Rust crates to the WebAssembly Package Manager"
url='https://github.com/wasmerio/cargo-wasmer'
license=('Apache')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wasmerio/cargo-wasmer/archive/refs/tags/cargo-wasmer-v$pkgver.tar.gz")
sha256sums=('97a8addd412368bcea2d83a7f5b74e9791afc7ac8fc0119218ade81aed38d126')
b2sums=('aa47120c75c067a5bf3279750f57459f56a9f7bfd7d3b41c8408834c9288f23c9ec7f987da470a224f2f7c79255a5ec90a9a9fef2d3d7341cdfce2aac04b51c1')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "cargo-wasmer-$pkgname-v$pkgver"

  cargo fetch --locked --target "$_target"
}

build() {
  cd "cargo-wasmer-$pkgname-v$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "cargo-wasmer-$pkgname-v$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-wapm

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
