# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]
#
# Kept at version 2.22 because with 2.40 ps3-spu-gcc would not build:
# /tmp/ccVRmFCg.s: Assembler messages:
# /tmp/ccVRmFCg.s:50: Error: Relocation doesn't fit. (relocation value = 0x474)
# make[2]: *** [../../../libgcc/config/spu/t-elf:33: cachemgr.o] Error 1

_target="spu"
_pkgname="binutils"
pkgname="ps3-${_target}-${_pkgname}"
pkgver="2.22"
pkgrel=2
pkgdesc="GNU Binutils for cross-compiling to ${_target} (PS3 GameOS)"
arch=(x86_64)
url='https://gcc.gnu.org/'
license=(GPL LGPL FDL)
depends=(ps3-env glibc jansson libelf zlib)
makedepends=(patch)
checkdepends=(dejagnu debuginfod bc)
options=(!emptydirs !strip staticlibs !lto)
source=(
	"https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2"
	"${_pkgname}-${pkgver}-ps3-${_target}.patch"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.guess"
	"https://git.savannah.gnu.org/cgit/config.git/plain/config.sub"
)
sha256sums=(
	'6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9'
	'd07bf1bc0c334c556840c4785f6ba90cd4b0c0ad498bff0ece9ce682f1bd25de'
	'SKIP'
	'SKIP'
)

source /opt/ps3dev/ps3toolchain.sh

_prefix="${PS3DEV}/${_target}"

prepare() {
	cd "${_pkgname}-${pkgver}"

	patch -p1 < "${srcdir}/${_pkgname}-${pkgver}-ps3-${_target}.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"

	mkdir "build-${_target}"
	cd "build-${_target}"

	local _configure_flags=(
		--prefix="${PS3DEV}/spu"
		#--libdir="${PS3DEV}/spu/host-libs/lib"
		--target="spu"

		--with-gcc
		--with-gnu-as
		--with-gnu-ld

		--enable-lto

		--disable-nls
		--disable-shared
		--disable-debug
		--disable-dependency-tracking
		--disable-werror
	)
	../configure "${_configure_flags[@]}"

	make
}

check() {
	cd "${_pkgname}-${pkgver}/build-${_target}"

	LDFLAGS="" make --keep-going check |& tee -a ${_target}-${_pkgname}-check.log || true
}

package() {
	cd "${_pkgname}-${pkgver}/build-${_target}"

	make DESTDIR="${pkgdir}" install

	if [ -f "${_target}-${_pkgname}-check.log" ]; then
		cp ${_target}-${_pkgname}-check.log "${pkgdir}/${_prefix}/"
	fi

	rm -f "${pkgdir}/${_prefix}/share/info/dir"
}

