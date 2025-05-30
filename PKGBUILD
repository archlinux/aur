# Maintainer: Giuliano Macedo <giuliano.programador@gmail.com>

_target=mips-elf
pkgname=$_target-gcc
pkgver=15.1.0
pkgrel=1
#_snapshot=8-20180427
pkgdesc='The GNU Compiler Collection - cross compiler for MIPS ELF (bare-metal) target'
arch=('i686' 'x86_64')
url='https://gcc.gnu.org/'
license=(GPL)
depends=($_target-binutils libmpc)
replaces=('cross-mips-elf-gcc')
conflicts=('cross-mips-elf-gcc')
options=('!ccache' '!distcc' '!emptydirs' '!libtool' '!strip')
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig})
sha512sums=('ddd35ca6c653dffa88f7c7ef9ee4cd806e156e0f3b30f4d63e75a8363361285cd566ee73127734cde6a934611de815bee3e32e24bfd2e0ab9f7ff35c929821c1'
            'SKIP')
validpgpkeys=('D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62')	# Jakub Jelinek <jakub@redhat.com>

prepare() {
	cd gcc-$pkgver

	echo $pkgver > gcc/BASE-VER

	# hack! - some configure tests for header files using "$CPP $CPPFLAGS"
 	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

 	mkdir -p "$srcdir"/build-gcc
}

build() {
	cd "$srcdir"/gcc-$pkgver
	
	./configure \
		--target=$_target \
		--prefix=/usr \
		--with-sysroot=/usr/$_target \
		--enable-languages=c,c++ \
		--enable-plugins \
		--disable-nls \
		--disable-threads \
		--disable-multilib \
		--disable-shared \
		--with-gnu-as \
		--with-gnu-ld \
		--without-headers 
	
	make all-gcc "inhibit_libc=true"
}

package() {
	cd $srcdir/gcc-$pkgver
	
	make DESTDIR=${pkgdir} install-gcc
	
	# remove these files as they are already in the system
	# (with native gcc)
	rm -Rf $pkgdir/usr/share/{man,info}
}