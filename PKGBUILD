# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=elephc
pkgver=0.25.2
pkgrel=1
pkgdesc="A PHP-to-native compiler. Takes a subset of PHP and compiles it directly to native assembly, producing standalone binaries."
url="https://elephc.dev/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/illegalstudio/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0cb276b659d90d63478f2d21f63bbee7b94686c31542fb19bc34897693034b03a5b60d79067444e08e0e36c3fa0d865690e8899072b3224ecd07c5b38bbbb938')

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
# check() {
#   cd "${srcdir}/${pkgname}-$pkgver"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
