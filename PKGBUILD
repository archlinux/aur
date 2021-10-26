# Maintainer: Arthur Carcano <arthur dot carcano at gmail dot com>
pkgname=rustc-demangle
pkgver=0.1.21
pkgrel=1
pkgdesc="Demangling for Rust symbols, C API"
arch=('any')
url="https://github.com/alexcrichton/rustc-demangle"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('386b1903f811987e1b4f0c98ef926397f4747759ded75068f63f0e086f80893c1c3cfca978c3b5cef9ad8155d2a3fd79a4a1dd880c10a53eea676a18306c0bcb')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo fetch
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
