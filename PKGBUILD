# $Id: PKGBUILD 223492 2017-04-17 15:29:29Z foutrelis $
# Maintainer: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Elijah Stone <elronnd@elronnd.net>
# Contributor: Daniel Kozak <kozzi11@gmail.com>

pkgname=('gdc' 'libgphobos')
pkgver=8.2.0
_majorver=${pkgver:0:1}
pkgrel=3
_islver=0.19
_dversion=2.081.1
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/D-Programming-GDC/GDC'
makedepends=('binutils>=2.26' 'git' 'gdc-stable')
source=(
	https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz
	http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
	gdc::git+https://github.com/D-Programming-GDC/GDC.git
	git+https://github.com/D-Programming-GDC/GDMD.git
	paths.diff
)
sha256sums=(
	'196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080'
	'd59726f34f7852a081fbd3defd1ab2136f174110fc2e0c8d10bb122173fa9ed8'
	'SKIP'
	'SKIP'
	'bb4219be52f61de48fc02f522220f013f12859a03c678417b03a1c8ee783d9dd'
)

_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}

prepare() {
    [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
    cd gcc

	# link isl for in-tree build
	ln -s ../isl-$_islver isl

	# Do not run fixincludes
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

    # Arch Linux installs x86_64 libraries /lib
    sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	# GDC setup
	cd "$srcdir"/gdc
	git checkout gdc-8
	git apply "$srcdir"/paths.diff
	./setup-gcc.sh ../gcc

	mkdir "$srcdir"/gcc-build
}

build() {
	cd "$srcdir"/gcc-build

	# using -pipe causes spurious test-suite failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
	export CFLAGS="${CFLAGS/-pipe/} -O2"
	export CXXFLAGS="${CXXFLAGS/-pipe/} -O2"

	"$srcdir"/gcc/configure --prefix=/usr \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--with-bugurl=https://bugs.archlinux.org/ \
		--with-pkgversion="$_dversion" \
		--enable-shared \
		--enable-static \
		--enable-threads=posix \
		--enable-libmpx \
		--with-system-zlib \
		--with-isl \
		--enable-__cxa_atexit \
		--disable-libunwind-exceptions \
		--enable-clocale=gnu \
		--disable-libstdcxx-pch \
		--disable-libssp \
		--enable-gnu-unique-object \
		--enable-linker-build-id \
		--enable-plugin \
		--enable-install-libiberty \
		--with-linker-hash-style=gnu \
		--enable-gnu-indirect-function \
		--enable-default-pie \
		--disable-multilib \
		--disable-werror \
		--disable-bootstrap \
		--enable-languages=d \
		gdc_include_dir=/usr/include/dlang/gdc

		#--enable-lto \
		#--enable-gold \

	make $MAKEFLAGS -j8
}

package_gdc() {
	depends=('gcc' 'perl' 'binutils' 'libgphobos')
	provides=("d-compiler=$_dversion")
	pkgdesc="Compiler for D programming language which uses gcc backend"
	conflicts=('gdc-stable')
    replaces=('gdc-stable')

	# compiler
	install -D -m755 "$srcdir"/gcc-build/gcc/gdc "$pkgdir"/usr/bin/gdc
	install -D -m755 "$srcdir"/gcc-build/gcc/cc1d "$pkgdir"/"$_libdir"/cc1d

	# tools
	install -D -m755 "$srcdir"/GDMD/dmd-script "$pkgdir"/usr/bin/gdmd
	install -D -m644 "$srcdir"/GDMD/dmd-script.1 "$pkgdir"/usr/share/man/man1/gdmd.1
}


package_libgphobos() {
	pkgdesc="Standard library for D programming language, GDC port"
	provides=('d-runtime' 'd-stdlib')
	options=('staticlibs')
    conflicts=('libgphobos-devel' 'libgphobos-stable')
    replaces=('libgphobos-devel' 'libgphobos-stable')

	cd "$srcdir"/gcc-build
	make -C $CHOST/libphobos DESTDIR="$pkgdir" install
}
