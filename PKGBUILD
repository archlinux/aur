# Maintainer: Arthur Carcano <arthur dot carcano at gmail dot com>
pkgname=rustc-demangle
pkgver=0.1.23
pkgrel=1
pkgdesc="Demangling for Rust symbols, C API"
arch=('x86_64' 'aarch64')
url="https://github.com/alexcrichton/rustc-demangle"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f43d7db477fa40431f6495a8017d0ff33d933a2420b90c033d1620d7494b9cae241b6b0b2e1398a505d7576ed00cca0c37f6463348f08644cb1c0c58b1b28835')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --package rustc-demangle-capi 
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --frozen
  cargo test --release --frozen --package rustc-demangle-capi 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "target/release/librustc_demangle."{a,so} --target-directory "$pkgdir/usr/lib/"
  install -Dm644 "crates/capi/include/rustc_demangle.h" --target-directory "$pkgdir/usr/include/"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
