# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=cargo-wapm
pkgver=0.3.3
pkgrel=1
pkgdesc="Cargo sub-command for publishing Rust crates to the WebAssembly Package Manager"
url="https://github.com/Michael-F-Bryan/cargo-wapm"
license=('Apache')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends_x86_64=('gcc-libs')
depends_i686=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Michael-F-Bryan/cargo-wapm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8a3e571c282aaaa26eb26a0684998b8621383c7f6ae879e3f110963ca614c28')
b2sums=('b303c6957431cccd93daef510a38359516e1e8ce72e0f420d2ede89a7c7b33f647da0d18e91af0cedcbb1e2d91bf3ccd1bb1e74c4ac5cc6d9857bf8560e81405')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$_target"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/cargo-wapm

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
