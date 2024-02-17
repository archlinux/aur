# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target_alias="ppu"
_pkgname="zlib"
pkgname="ps3-${_pkgname}"
pkgver="1.3.1"
pkgrel=2
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url="https://www.zlib.net/"
license=(custom)
depends=(ps3-env ps3-ppu-gcc)
options=(!emptydirs !strip staticlibs)
source=("https://zlib.net/fossils/zlib-${pkgver}.tar.gz")
sha256sums=('9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23')

source /opt/ps3dev/ps3toolchain.sh

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	sed -e "s/^static: /static: \$(STATICLIB) # /g" -i Makefile.in
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	export AR="${_target_alias}-ar" CC="${_target_alias}-gcc" RANLIB="${target_alias}-ranlib"	
	export CFLAGS="-O3 -flto=auto -ffat-lto-objects -DNDEBUG"
	local _configure_flags=(
		--prefix="${PS3DEV}/portlibs/ppu"
		--static
	)
	./configure "${_configure_flags[@]}"

	make static
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
