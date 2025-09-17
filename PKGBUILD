# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target="powerpc64-ps3-elf"
_target_alias="ppu"
_newlib_pkgver="1.20.0"
_gmp_pkgver="6.2.1"
_isl_pkgver="0.24"
_mpc_pkgver="1.2.1"
_mpfr_pkgver="4.1.0"
_pkgname="gcc"
pkgname="ps3-${_target_alias}-${_pkgname}"
pkgver="15.2.0"
pkgrel=1
pkgdesc="GCC for cross-compiling to ${_target_alias} (PS3 GameOS)"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://gcc.gnu.org/'
license=(GPL3 LGPL FDL custom)
makedepends=(patch python)
checkdepends=(dejagnu expect inetutils python-pytest tcl)
depends=(ps3-env "ps3-ppu-binutils>=2.45")
options=(!emptydirs !strip staticlibs !lto)
source=(
	"https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.xz"
	"${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"
	"http://sourceware.org/pub/newlib/newlib-${_newlib_pkgver}.tar.gz"
	"newlib-${_newlib_pkgver}-ps3-${_target_alias}.patch"
	"http://ftp.gnu.org/gnu/gmp/gmp-${_gmp_pkgver}.tar.bz2"
	"http://gcc.gnu.org/pub/gcc/infrastructure/isl-${_isl_pkgver}.tar.bz2"
	"http://ftp.gnu.org/gnu/mpc/mpc-${_mpc_pkgver}.tar.gz"
	"http://ftp.gnu.org/gnu/mpfr/mpfr-${_mpfr_pkgver}.tar.bz2"
)
sha256sums=(
	'438fd996826b0c82485a29da03a72d71d6e3541a83ec702df4271f6fe025d24e'
	'a19523a965bc412598df0d0b41e8dbb83ad6e28ea229150125622df55ddc4057'
	'c644b2847244278c57bec2ddda69d8fab5a7c767f3b9af69aa7aa3da823ff692'
	'b2a61e2afa6b09c5b2ad63cc02d7d79ccd11f4c839b35d5bad1d0e22dea0c701'
	'eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a36b4d7c'
	'fcf78dd9656c10eb8cf9fbd5f59a0b6b01386205fe1934b3b287a0a1898145c0'
	'17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459'
	'feced2d430dd5a97805fa289fed3fc8ff2b094c02d05287fd6133e7f1f0ec926'
)

source /opt/ps3dev/ps3toolchain.sh

_prefix="${PS3DEV}/${_target_alias}"

prepare() {
	patch -p1 -d "newlib-${_newlib_pkgver}" < "${srcdir}/newlib-${_newlib_pkgver}-ps3-${_target_alias}.patch"

	cd "${_pkgname}-${pkgver}"*/

	patch -p1 < "${srcdir}/${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"

	ln -s "${srcdir}/newlib-${_newlib_pkgver}/newlib" .
	ln -s "${srcdir}/newlib-${_newlib_pkgver}/libgloss" .

	ln -s "${srcdir}/gmp-${_gmp_pkgver}.tar.bz2" .
	ln -s "${srcdir}/isl-${_isl_pkgver}.tar.bz2" .
	ln -s "${srcdir}/mpc-${_mpc_pkgver}.tar.gz" .
	ln -s "${srcdir}/mpfr-${_mpfr_pkgver}.tar.bz2" .
}

build() {
	cd "${_pkgname}-${pkgver}"*/

	# symlinked in prepare(), just unpack
	./contrib/download_prerequisites

	mkdir -p "build-${_target_alias}"
	cd "build-${_target_alias}"

	# Avoid breakage
	export CFLAGS="${CFLAGS/-Werror=format-security/}"
	export CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

	local _configure_flags=(
		--prefix="${PS3DEV}/ppu"
		--target="${_target}"
		--with-cpu="cell"
		--with-newlib
		--with-system-zlib

		--enable-languages="c"
		--enable-long-double-128
		--enable-lto
		--enable-threads
		--enable-newlib-multithread
		--enable-newlib-hw-fp

		--disable-dependency-tracking
		--disable-libcc1
		#--disable-libstdcxx-pch
		--disable-multilib
		--disable-nls
		--disable-shared
		--disable-win32-registry
	)
	../configure "${_configure_flags[@]}"

	make
}

check() {
	cd "${_pkgname}-${pkgver}"*"/build-${_target_alias}"

	LDFLAGS="" make --keep-going check |& tee -a "ps3-${_target_alias}-${_pkgname}-check.log" || true
}

package() {
	cd "${_pkgname}-${pkgver}"*"/build-${_target_alias}"

	make DESTDIR="${pkgdir}" install

	if [ -f "ps3-${_target}-${_pkgname}-check.log" ]; then
		cp "ps3-${_target}-${_pkgname}-check.log" "${pkgdir}/${_prefix}/"
	fi

	rm -f "${pkgdir}/${_prefix}/share/info/dir"

	cd "${pkgdir}/${_prefix}/bin"
	for b in ${_target}-*; do
		ln -s "${b}" "${b/${_target}/${_target_alias}}"
	done
}
