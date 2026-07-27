# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=phpantom_lsp
pkgver=0.9.0
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
b2sums=('08046b8ad2920e7ba179a6c5aa6dff6b60f0b6f935287d7a9b3efbaed2c7fb683b1508f4a41c526fd087f238b482bc26536e08964abf99179daa8f35f3e8d199')

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

check() {
  cd "${srcdir}/${pkgname}-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
