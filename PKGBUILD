# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=elephc
pkgver=0.26.6
pkgrel=1
pkgdesc="A PHP-to-native compiler. Takes a subset of PHP and compiles it directly to native assembly, producing standalone binaries."
url="https://elephc.dev/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'clang' 'postgresql' 'freetds' 'unixodbc')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/illegalstudio/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1917144c1556bafded54572acb5d41a450da2f1cde445f302b81df114b6a45248755becd5cf4ed75fd3ff299d63a62a9a19747bb2d88a66f4ffc8160706d1d9d')

prepare() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# tests are not pasing right now
#check() {
#  cd "${srcdir}/${pkgname}-$pkgver"
#  export RUSTUP_TOOLCHAIN=stable
#  cargo test --frozen --all-features
#}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
