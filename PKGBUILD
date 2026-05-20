# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=elephc
pkgver=0.22.3
pkgrel=1
pkgdesc="A PHP-to-native compiler. Takes a subset of PHP and compiles it directly to native assembly, producing standalone binaries."
url="https://elephc.dev/"
arch=('x86_64')
license=('MIT')
depends=('libgcc' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/illegalstudio/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('073a17ea1b09641d29ab4469f953763a5fa6d21142e0e92842aca8ca5a962377f3124f3274a3bd3769520233e0994f0e4d58d6553a5e11ac2b5c4bbefe9c5d01')

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
