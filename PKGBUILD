# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD file is inspired from the package ghdl
# https://aur.archlinux.org/packages/ghdl/

pkgname=ghdl-gcc-git
pkgver=0.37dev.git20190702
pkgrel=1
arch=('any')
pkgdesc='VHDL simulator - GCC flavour'
url='https://github.com/tgingold/ghdl'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-llvm-git' 'ghdl-mcode-git')
makedepends=('gcc-ada' 'git')
install=ghdl.install
options=(!emptydirs staticlibs)

_gccver=8.3.0
_islver=0.20

source=(
	"ghdl::git://github.com/ghdl/ghdl.git"
	"ftp://ftp.gnu.org/gnu/gcc/gcc-${_gccver}/gcc-${_gccver}.tar.xz"
	"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
)
md5sums=(
	'SKIP'
	'65b210b4bfe7e060051f799e0f994896'
	'cb396f31b24aeeac49840b519741b0e1'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from configure)
	_distver=`sed -n -e 's/^ghdl_version=.*"\(.*\)".*/\1/p' configure | tr -d '-'`
	# Date of the last git commit
	_gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`

	echo $_distver.git$_gitver;
}

prepare() {
	cd "${srcdir}"
	[[ ! -d gcc ]] && ln -sf gcc-${_gccver/+/-} gcc

	cd "${srcdir}/ghdl"

	./configure \
		--prefix=/usr \
		--with-gcc="${srcdir}/gcc"

	make copy-sources

	cd "${srcdir}/gcc"

	# Link isl for in-tree build
	ln -sf ../isl-${_islver} isl

	# Do not run fixincludes - FIXME Why?
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	# Arch Linux installs libraries in /lib
	# FIXME How to fix this for all architectures ?
	sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
	sed -i '/lp64=/s/lib64/lib/' gcc/config/aarch64/t-aarch64-linux

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	# Remove all previously built stuff (optional)
	rm -rf "${srcdir}/gcc-build"
	mkdir -p "${srcdir}/gcc-build"
}

build() {
	cd "${srcdir}/gcc-build"

	# Using -pipe causes spurious test-suite failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
	CFLAGS=${CFLAGS/-pipe/}
	CXXFLAGS=${CXXFLAGS/-pipe/}

	# Optional: Use makepkg config for debug mode (see your /etc/makepkg.conf)
	#CFLAGS=${DEBUG_CFLAGS/-pipe/}
	#CXXFLAGS=${DEBUG_CXXFLAGS/-pipe/}

	"${srcdir}"/gcc-${_gccver}/configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--enable-shared \
		--enable-threads=posix \
		--with-system-zlib \
		--with-isl \
		--enable-__cxa_atexit \
		--disable-libunwind-exceptions \
		--enable-clocale=gnu \
		--disable-libstdcxx-pch \
		--disable-libssp \
		--enable-gnu-unique-object \
		--enable-linker-build-id \
		--enable-lto \
		--enable-plugin \
		--enable-install-libiberty \
		--with-linker-hash-style=gnu \
		--enable-gnu-indirect-function \
		--disable-multilib \
		--disable-werror \
		--enable-checking=release \
		--enable-default-pie \
		--enable-default-ssp \
		--enable-languages=vhdl \
		--disable-bootstrap \
		--disable-libgomp \
		--disable-libquadmath

	# Build GHDL
	make

	cd "${srcdir}/ghdl"

	# Build VHDL libraries and runtime,
	# with some tweaks to enable running GHDL without installing it
	make -j1 \
		GHDL_GCC_BIN="${srcdir}/gcc-build/gcc/ghdl" \
		GHDL1_GCC_BIN="--GHDL1=${srcdir}/gcc-build/gcc/ghdl1" \
		ghdllib
}

package() {
  local _xgcc="${srcdir}/gcc-build/gcc/xgcc"
  local _machine=$(${_xgcc} -dumpmachine)
  local _version=$(${_xgcc} -dumpversion)

	# Install GHDL
	cd "${srcdir}/gcc-build"
	make DESTDIR="${pkgdir}" install

	# Install VHDL libraries and runtime
	cd "${srcdir}/ghdl"
	make DESTDIR="${pkgdir}" install

	# Remove gcc-specific files, keep only what is related to ghdl
	cd "${pkgdir}"
	rm -rf "usr/"{include,share/{locale,man}}
	find "usr/lib" \
		-maxdepth 1 -mindepth 1 -not -name 'gcc' -not -name 'ghdl' \
		-exec rm -rf {} +
	find "usr/lib/gcc/${_machine}/${_version}" \
		-maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
		-exec rm -rf {} +
	find "usr/bin" "usr/share/info" \
		-maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
		-exec rm -rf {} +
}
