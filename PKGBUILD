# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# This PKGBUILD file is inspired from the package ghdl
# https://aur.archlinux.org/packages/ghdl/

pkgname=ghdl-hg
pkgver=0.33dev.hg818
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='VHDL simulator'
url='http://sourceforge.net/projects/ghdl-updates/'
license=('GPLv2')

provides=('ghdl')
conflicts=('ghdl')
makedepends=('gcc-ada' 'mercurial')
install=ghdl.install
options=(!emptydirs staticlibs)

_gccver=4.9.2
_islver=0.12.2
_cloogver=0.18.1

source=(
	"ghdl::hg+http://hg.code.sf.net/p/ghdl-updates/code"
	"ftp://ftp.gnu.org/gnu/gcc/gcc-${_gccver}/gcc-${_gccver}.tar.bz2"
	"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
	"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
)
md5sums=(
	'SKIP'
	'4df8ee253b7f3863ad0b86359cd39c43'
	'e039bfcfb6c2ab039b8ee69bf883e824'
	'e34fca0540d840e5d0f6427e98c92252'
)

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from version.ads)
	_distver=`sed -n -e 's/.*GHDL \([0-9.a-z]*\) (.*/\1/p' src/version.ads`
	# Changeset number (asked to mercurial)
	_hgver=`hg log -l1 | sed -n -e 's/.*changeset:\s*\([0-9]*\).*/\1/p'`

	echo $_distver.hg$_hgver;
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

	make
}

package() {
	cd "${srcdir}/gcc-build"

	# Make a full install
	make DESTDIR="${pkgdir}" install

	# Remove gcc-specific files, keep only what is related to ghdl
	rm -rf "${pkgdir}"/usr/{share/{locale,gcc-${_gccver},man/man7},include}
	find "${pkgdir}"/usr/lib \
		-maxdepth 1 -mindepth 1 -not -name 'gcc' \
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
