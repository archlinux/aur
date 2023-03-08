# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

_target="powerpc-ps3-elf"
_target_alias="ppu"
_newlib_pkgver="1.20.0"
_gmp_pkgver="6.1.0"
_isl_pkgver="0.18"
_mpc_pkgver="1.0.3"
_mpfr_pkgver="3.1.4"
_pkgname="gcc"
pkgname="ps3-${_target_alias}-${_pkgname}"
pkgver="9.5.0"
pkgrel=1
pkgdesc="GCC for cross-compiling to ${_target_alias} (PS3 GameOS)"
arch=(x86_64 aarch64 powerpc64le powerpc64 powerpc riscv64)
url='https://gcc.gnu.org/'
license=(GPL3 LGPL FDL custom)
makedepends=(patch python)
checkdepends=(dejagnu expect inetutils python-pytest tcl)
depends=(ps3-ppu-binutils)
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
	'27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927ce5a0a2915a95cf8f'
	'86d3dca49e0a8cf0d0b56619c19da2047c5b6bda939e4856f4de78e4866fd55b'
	'c644b2847244278c57bec2ddda69d8fab5a7c767f3b9af69aa7aa3da823ff692'
	'9ffcdfc74871b267d53b66e525162467ce248d89b77506bb8db2409f3d0b51ae'
	'498449a994efeba527885c10405993427995d3f86b8768d8cdf8d9dd7c6b73e8'
	'6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
	'617decc6ea09889fb08ede330917a00b16809b8db88c29c31bfbb49cbf88ecc3'
	'd3103a80cdad2407ed581f3618c4bed04e0c92d1cf771a65ead662cc397f7775'
)

# PS3DEV
export PS3DEV="/opt/ps3dev"
export PSL1GHT="${PS3DEV}"
export PATH="${PATH}:${PS3DEV}/bin"
export PATH="${PATH}:${PS3DEV}/ppu/bin"
export PATH="${PATH}:${PS3DEV}/spu/bin"

_prefix="${PS3DEV}/${_target_alias}"

prepare() {
	patch -p1 -d "newlib-${_newlib_pkgver}" < "${srcdir}/newlib-${_newlib_pkgver}-ps3-${_target_alias}.patch"

	cd "${_pkgname}-${pkgver}"

	patch -p1 < "${srcdir}/${_pkgname}-${pkgver}-ps3-${_target_alias}.patch"

	ln -s "${srcdir}/newlib-${_newlib_pkgver}/newlib" .
	ln -s "${srcdir}/newlib-${_newlib_pkgver}/libgloss" .

	ln -s "${srcdir}/gmp-${_gmp_pkgver}.tar.bz2" .
	ln -s "${srcdir}/isl-${_isl_pkgver}.tar.bz2" .
	ln -s "${srcdir}/mpc-${_mpc_pkgver}.tar.gz" .
	ln -s "${srcdir}/mpfr-${_mpfr_pkgver}.tar.bz2" .
}

build() {
	cd "${_pkgname}-${pkgver}"

	mkdir -p "build-${_target_alias}"
	cd "build-${_target_alias}"

	# Avoid breakage
	CFLAGS="${CFLAGS/-Werror=format-security/}"
	CXXFLAGS="${CXXFLAGS/-Werror=format-security/}"

	local _configure_flags=(
		--prefix="${PS3DEV}/ppu"
		--target="powerpc64-ps3-elf"
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
	cd "${_pkgname}-${pkgver}/build-${_target_alias}"

	LDFLAGS="" make --keep-going check |& tee -a "ps3-${_target_alias}-${_pkgname}-check.log" || true
}

package() {
	cd "${_pkgname}-${pkgver}/build-${_target_alias}"

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
