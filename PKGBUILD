# Maintainer: Arthur Carcano <arthur dot carcano at gmail dot com>
pkgname=rustc-demangle
pkgver=0.1.24
pkgrel=4
pkgdesc="Demangling for Rust symbols, C API"
arch=('x86_64' 'aarch64')
url="https://github.com/rust-lang/rustc-demangle"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rust-lang/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1b2059e1fbb8f58b0faca535b2d38b9d509e5ec7aa6096da3f5aafb630c527f6fdeb033b4cf58ce9e1283fd91bbb5ae9d7ef74b13cfa62c16cb46d62fd7be9c2')

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
