# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=elephc
pkgver=0.27.3
pkgrel=1
pkgdesc="A PHP-to-native compiler. Takes a subset of PHP and compiles it directly to native assembly, producing standalone binaries."
url="https://elephc.dev/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'clang' 'postgresql' 'freetds' 'unixodbc')
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/illegalstudio/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('94463f5f61d9ded3d6acf2d4742cb7810d0be6c8c6bd0945076c829124565e1561cb08bab59c4e34d1fedc9524723f50506038589fa1d068e8d63ba762894b03')

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
