# Maintainer: grant0417 <grant0417@protonmail.com>
# Contributor: Araragi Hokuto <kanseihonbucho@protonmail.com>
# Contributor: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
pkgname=$_target-gcc
pkgver=10.3.0
pkgrel=1
pkgdesc='The GNU Compiler Collection - cross compiler for x86_64-elf target'
arch=(x86_64)
url='http://gcc.gnu.org/'
license=(GPL LGPL)
depends=($_target-binutils zlib libmpc mpfr gmp)
options=(!emptydirs)
source=("https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz.sig")
sha256sums=('64f404c1a650f27fc33da242e1f2df54952e3963a49e06e73f6940f3223ac344'
            'SKIP')
_basedir=gcc-$pkgver
validpgpkeys=("13975A70E63C361C73AE69EF6EEB81F8981C74C7")

prepare() {
	cd $_basedir
	
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

	mkdir -p $srcdir/gcc-build
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

