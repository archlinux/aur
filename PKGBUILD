# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=phpantom_lsp
pkgver=0.11.1
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
b2sums=('78565cd863478ecccd63cdcca85e5f06ea130b88703031b86de08bb3b748f3d3204849248e47da5d6613280172f41068f9b8806bbdeacd58a4626fe312602251')

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
