# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=phpantom_lsp
pkgver=0.10.0
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
b2sums=('1c2b99df2b9793b387101b606fa5ec525f37b745b9e8201d609a005c2555dc0e0c6cb2172c1c4e41edb593e68508200016b2d74d73209f7e1a7b5a9d8eed84c9')

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
