# Maintainer: Arthur Carcano <arthur dot carcano at gmail dot com>
pkgname=rustc-demangle
pkgver=0.1.18
pkgrel=1
pkgdesc="Demangling for Rust symbols, C API"
arch=('x86_64')
url="https://github.com/alexcrichton/rustc-demangle"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alexcrichton/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('263a4cc2e49f1e4fdd5f665a6f9d569e1606ef9ca1708f3f8aa10e65491418055425dfcdf755c12ae929e62b73137b5eb31a7ec66eaaf013926c40a66d7e4134')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --package rustc-demangle-capi 
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --frozen
  cargo test --release --frozen --package rustc-demangle-capi 
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "target/release/librustc_demangle."{a,so} --target-directory "$pkgdir/usr/lib/${pkgname}/"
  install -Dm644 "crates/capi/include/rustc_demangle.h" --target-directory "$pkgdir/usr/include/${pkgname}/"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
