# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD file is inspired from the package ghdl
# https://aur.archlinux.org/packages/ghdl/

pkgname=ghdl-gcc-git
pkgver=0.34dev.git20170619
pkgrel=1
arch=('any')
pkgdesc='VHDL simulator - GCC flavour'
url='http://sourceforge.net/projects/ghdl-updates/'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl' 'ghdl-llvm-git' 'ghdl-mcode-git')
makedepends=('gcc-ada' 'git')
install=ghdl.install
options=(!emptydirs staticlibs)

_gccver=4.9.3
_islver=0.12.2
_cloogver=0.18.1

source=(
	#"ghdl::git://git.code.sf.net/p/ghdl-updates/ghdl-updates.git"
	"ghdl::git://github.com/tgingold/ghdl.git"
	"ftp://ftp.gnu.org/gnu/gcc/gcc-${_gccver}/gcc-${_gccver}.tar.bz2"
	"ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
	"ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-${_cloogver}.tar.gz"
)
md5sums=(
	'SKIP'
	'6f831b4d251872736e8e9cc09746f327'
	'e039bfcfb6c2ab039b8ee69bf883e824'
	'e34fca0540d840e5d0f6427e98c92252'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from version.in)
	_distver=`sed -n -e 's/.*Ghdl_Ver .*"\(.*\)".*/\1/p' src/version.in | tr -d '-'`
	# Date of the last git commit
	_gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`

	echo $_distver.git$_gitver;
}

prepare() {
	# Note: Nothing to do in the ghdl directory
	#cd "${srcdir}/ghdl"

	cd "${srcdir}/gcc-${_gccver}"
	# link isl/cloog for in-tree builds
	ln -sf ../isl-${_islver} isl
	ln -sf ../cloog-${_cloogver} cloog

	# Do not run fixincludes - FIXME Why?
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	# Arch Linux installs x86_64 libraries in /lib
	[[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
}

build() {
	cd "${srcdir}/ghdl"

	# FIXME Why should Fortify be disabled?
	CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

	# Using -pipe causes spurious test-suite failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
	CFLAGS=${CFLAGS/-pipe/}
	CXXFLAGS=${CXXFLAGS/-pipe/}

	# Optional: Use makepkg config for debug mode (see your /etc/makepkg.conf)
	#CFLAGS=${DEBUG_CFLAGS/-pipe/}
	#CXXFLAGS=${DEBUG_CXXFLAGS/-pipe/}

	./configure --prefix=/usr \
		--with-gcc="${srcdir}/gcc-${_gccver}"

	make copy-sources

	# Optional: remove all previously built stuff
	rm -rf "${srcdir}/gcc-build"

	mkdir -p "${srcdir}/gcc-build"
	cd "${srcdir}/gcc-build"

	"${srcdir}"/gcc-${_gccver}/configure --prefix=/usr \
		--libdir=/usr/lib --libexecdir=/usr/lib \
		--mandir=/usr/share/man --infodir=/usr/share/info \
		--disable-bootstrap \
		--enable-languages=vhdl \
		--enable-shared --enable-threads=posix \
		--with-system-zlib --enable-__cxa_atexit \
		--disable-libunwind-exceptions --enable-clocale=gnu \
		--disable-libstdcxx-pch --disable-libssp \
		--enable-gnu-unique-object --enable-linker-build-id \
		--enable-cloog-backend=isl \
		--enable-plugin --enable-install-libiberty \
		--with-linker-hash-style=gnu \
		--disable-multilib --disable-werror \
		--enable-checking=release \
		--enable-lto \
		#--without-cloog --without-isl

	# Build GHDL
	make

	cd "${srcdir}/ghdl"

	# Build VHDL libraries and runtime,
	# with some tweaks to enable running GHDL without installing it
	make \
		GHDL_GCC_BIN="${srcdir}/gcc-build/gcc/ghdl" \
		GHDL1_GCC_BIN="--GHDL1=${srcdir}/gcc-build/gcc/ghdl1" \
		ghdllib
}

package() {

	# Install GHDL
	cd "${srcdir}/gcc-build"
	make DESTDIR="${pkgdir}" install

	# Install VHDL libraries and runtime
	cd "${srcdir}/ghdl"
	make DESTDIR="${pkgdir}" install

	# Remove gcc-specific files, keep only what is related to ghdl
	cd "${srcdir}/gcc-build"
	rm -rf "${pkgdir}"/usr/{share/{locale,gcc-${_gccver},man/man7},include}
	find "${pkgdir}"/usr/lib \
		-maxdepth 1 -mindepth 1 -not -name 'gcc' -not -name 'ghdl' \
		-exec rm -rf '{}' +
	find "${pkgdir}"/usr/lib/gcc/$(./gcc/xgcc -dumpmachine)/${_gccver} \
		-maxdepth 1 -mindepth 1 -not -name 'vhdl' -not -name 'ghdl1' \
		-exec rm -rf '{}' +
	find "${pkgdir}"/usr/bin \
		"${pkgdir}"/usr/share/man/man1 \
		"${pkgdir}"/usr/share/info \
		-maxdepth 1 -mindepth 1 -not -name 'ghdl*' \
		-exec rm -rf '{}' +
}
