# Maintainer: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
pkgname=$_target-gcc
pkgver=8.2.0
pkgrel=2
pkgdesc='The GNU Compiler Collection - cross compiler for x86_64-elf target'
arch=(x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL)
depends=($_target-binutils zlib libmpc mpfr gmp)
options=(!emptydirs)
source=("https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz")
sha256sums=('196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080')
_basedir=gcc-$pkgver

prepare() {
	cd $_basedir
	
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

	mkdir $srcdir/gcc-build
}

build() {
	cd gcc-build

	$srcdir/$_basedir/configure \
		--target=$_target \
		--libexecdir=/usr/lib \
		--prefix=/usr \
		--disable-nls \
		--disable-plugin \
		--enable-languages=c,c++ \
		--without-headers

	make all-gcc
	make all-target-libgcc
}

check() {
	cd gcc-build

	# increase stack size to prevent test failures
	# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
	ulimit -s 32768

	# do not abort on error as some are "expected"
	make -k check || true
	$srcdir/$_basedir/contrib/test_summary
}

package() {
	cd gcc-build

	make DESTDIR="$pkgdir" install-gcc
	make DESTDIR="$pkgdir" install-target-libgcc

	# Remove info and make since it expected already present by host compiler
	rm -vr "$pkgdir"/usr/share/{info,man}
}

