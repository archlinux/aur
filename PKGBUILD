# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target_alias="ppu"
_pkgname="zstd"
pkgname="ps3-${_pkgname}"
pkgver="1.5.5"
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url="https://www.zlib.net/"
license=(custom)
depends=(ps3-env ps3-ppu-gcc)
options=(!emptydirs !strip staticlibs)
source=(
	"https://github.com/facebook/zstd/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.zst"
)
sha256sums=(
	'ce264bca60eb2f0e99e4508cffd0d4d19dd362e84244d7fc941e79fa69ccf673'
)

source /opt/ps3dev/ps3toolchain.sh

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
