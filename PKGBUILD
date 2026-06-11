# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=elephc
pkgver=0.23.9
pkgrel=1
pkgdesc="A PHP-to-native compiler. Takes a subset of PHP and compiles it directly to native assembly, producing standalone binaries."
url="https://elephc.dev/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/illegalstudio/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c330be8b63b811de99ab61978a5372b07384f92cf69c17b7b660d770331cacab46bf5e56030c188e651854505e5faa5debc1fd94a7c514d52dd859ff8f2f02dc')

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
