# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=phpantom_lsp
pkgver=1.0.0
pkgrel=1
pkgdesc="Fast PHP language server with deep type intelligence."
url="https://phpantom-dev.github.io/phpantom_lsp/"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
license=('MIT')
depends=(
	'glibc'
	'xz'
	'libgcc'
	'bzip2'
)
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PHPantom-dev/${pkgname}/archive/refs/tags/$pkgver.tar.gz")
b2sums=('4ee8cfdcd9a28aa8938d2c9abd7296a5e268957761a412dc7a76e1adf5382b7904caa924db766c81d43c027643d983ea303f91a0234a16ac4a04d9fe60f63af6')

prepare() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
