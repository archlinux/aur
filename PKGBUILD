# $Id: PKGBUILD 223492 2017-04-17 15:29:29Z foutrelis $
# Maintainer: Mihails Strasuns <public@dicebot.lv>
# Contributor: Moritz Maxeiner <moritz@ucworks.org>
# Contributor: Jerome Berger <jeberger@free.fr>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Elijah Stone <elronnd@protonmail.ch>

pkgname=('gdc' 'libgphobos-devel' 'libgphobos')
pkgver=7.2.0
pkgrel=3
_islver=0.18
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/D-Programming-GDC/GDC"
makedepends=('binutils>=2.26' 'git')

source=(
	https://ftp.gnu.org/pub/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz
	http://isl.gforge.inria.fr/isl-$_islver.tar.bz2
	gdc::git+https://github.com/D-Programming-GDC/GDC.git
	git+https://github.com/D-Programming-GDC/GDMD.git
	paths.diff
	init.diff
)
sha256sums=(
	'1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'
	'6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
	'SKIP'
	'SKIP'
	'fefe9298f8d5859758ca63bab084984baa8adbbd85b3b3b8798283731321df7b'
	'5f9efcd016389c3940afdc5819c218f44557c816a785f99373d796bebb0e7465'
)

_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
	cd $srcdir/gcc-$pkgver

	# link isl for in-tree build
	ln -s ../isl-$_islver isl

	# Do not run fixincludes
	sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

	# Arch Linux installs x86_64 libraries /lib
	[[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

	# GDC setup
	cd $srcdir/gdc
	git checkout gdc-7
	git apply $srcdir/paths.diff
	git apply $srcdir/init.diff
	./setup-gcc.sh ../gcc-$pkgver

	mkdir $srcdir/gcc-build
}

build() {
	cd $srcdir/gcc-build

	# using -pipe causes spurious test-suite failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
	export CFLAGS="${CFLAGS/-pipe/} -O2"
	export CXXFLAGS="${CXXFLAGS/-pipe/} -O2"

	$srcdir/gcc-$pkgver/configure --prefix=/usr \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--mandir=/usr/share/man \
		--infodir=/usr/share/info \
		--with-bugurl=https://bugs.archlinux.org/ \
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
		--enable-languages=d \
		gdc_include_dir=/usr/include/dlang/gdc

		#--enable-lto \
		#--enable-gold \

	make $MAKEFLAGS
}

package_gdc() {
	depends=('gcc' 'perl' 'binutils' 'libgphobos-devel')
	provides=("d-compiler=2.068.2")
	pkgdesc="Compiler for D programming language which uses gcc backend"

	# compiler
	install -D -m755 $srcdir/gcc-build/gcc/gdc $pkgdir/usr/bin/gdc
	install -D -m755 $srcdir/gcc-build/gcc/cc1d $pkgdir/usr/lib/gcc/$CHOST/$pkgver/cc1d

	# tools
	install -D -m755 $srcdir/GDMD/dmd-script $pkgdir/usr/bin/gdmd
	install -D -m644 $srcdir/GDMD/dmd-script.1 $pkgdir/usr/share/man/man1/gdmd.1
}


package_libgphobos-devel() {
	pkgdesc="Standard library for D programming language, GDC port"
	provides=("d-runtime" "d-stdlib")
	options=("staticlibs")

	cd $srcdir/gcc-build
	make -C $CHOST/libphobos DESTDIR=$pkgdir install

	# remove shared library bits, they go into own package
	rm $pkgdir/usr/lib/lib*so*
}

package_libgphobos() {
	pkgdesc="Shared standard library for D programming language, GDC port"
	provides=("d-runtime" "d-stdlib")

	cd $srcdir/gcc-build
	install -D -m644 $CHOST/libphobos/src/.libs/libgphobos.so $pkgdir/usr/lib/libgphobos.so
	install -D -m644 $CHOST/libphobos/libdruntime/.libs/libgdruntime.so $pkgdir/usr/lib/libgdruntime.so
}
