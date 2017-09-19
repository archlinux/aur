# Maintainer: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
pkgname=$_target-gcc
pkgver=7.2.0
pkgrel=2
pkgdesc='The GNU Compiler Collection - cross compiler for x86_64-elf target'
arch=(x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL)
depends=($_target-binutils zlib libmpc mpfr gmp)
options=(!emptydirs)
source=("https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
	"libiberty-ignore-cflags.patch")
sha256sums=('1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'
	'8b2aea00e98f7c311b1d0fb14e4b435a03c65fde32bc992c924edb6fa7b83c9c')
_basedir=gcc-$pkgver

prepare() {
	cd $_basedir
	
	patch -p1 -i $srcdir/libiberty-ignore-cflags.patch

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

