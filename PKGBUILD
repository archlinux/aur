# Maintainer: Marc Boocha <marcboocha@gmail.com>

_target=x86_64-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}
pkgver=2.32
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
options=(!emptydirs !docs)
source=("http://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04')
_basedir=binutils-$pkgver

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

    sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

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
