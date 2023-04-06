# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target_alias="ppu"
_pkgname="zstd"
pkgname="ps3-${_pkgname}"
pkgver="1.5.4"
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url="https://www.zlib.net/"
license=(custom)
depends=(ps3-ppu-gcc)
options=(!emptydirs !strip staticlibs)
source=(
	"https://github.com/facebook/zstd/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.zst"
)
sha256sums=(
	'6925880b84aca086308c27036ef1c16e76817372301ead7c37f90e23567f704e'
)

# PS3DEV
export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PS3DEV}/bin:${PATH}"
export PATH="${PS3DEV}/ppu/bin:${PATH}"
export PATH="${PS3DEV}/spu/bin:${PATH}"

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/lib"

	export AR="${_target_alias}-ar" CC="${_target_alias}-gcc" RANLIB="${_target_alias}-ranlib"	
	export CFLAGS="-O3 -flto=auto -ffat-lto-objects -DNDEBUG"
	make libzstd.a-nomt-release
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/lib"

	make PREFIX="${PS3DEV}/portlibs/${_target_alias}" DESTDIR="${pkgdir}" install-includes install-pc install-static
}
