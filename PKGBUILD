# Maintainer: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}
pkgver=2.29
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
options=(!emptydirs !docs)
source=("http://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "libiberty-ignore-cflags.patch")
sha256sums=('0b871e271c4c620444f8264f72143b4d224aa305306d85dd77ab8dce785b1e85'
            '8b2aea00e98f7c311b1d0fb14e4b435a03c65fde32bc992c924edb6fa7b83c9c')
_basedir=binutils-$pkgver

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	patch -p1 -i $srcdir/libiberty-ignore-cflags.patch

	mkdir $srcdir/binutils-build
}

build() {
	cd binutils-build

	$srcdir/$_basedir/configure \
		--target=$_target \
		--prefix=${_sysroot} \
		--bindir=/usr/bin \
		--with-sysroot=${_sysroot} \
		--disable-nls \
		--disable-werror

		make
}

check() {
	cd binutils-build
  
	# do not abort on errors - manually check log files
	make -k check
}

package() {
	cd binutils-build

	make DESTDIR="$pkgdir" install

	# Remove info and make since it expected already present by host compiler
	rm -r ${pkgdir}/${_sysroot}/share/{info,man}
}
