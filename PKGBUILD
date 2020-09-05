# Maintainer: Finlay Maroney <finman292004@protonmail.com>

_target=x86_64-elf
_sysroot=/usr/lib/${_target}
_pkgname=binutils

pkgname=$_target-${_pkgname}
pkgver=2.35
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the x86_64-elf target'
arch=(x86_64)
url='http://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
options=(!emptydirs !docs)
source=("http://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://mirrors.kernel.org/gnu/binutils/binutils-$pkgver.tar.xz.sig")

sha256sums=('1b11659fb49e20e18db460d44485f09442c8c56d5df165de9461eb09c8302f85'
            'SKIP')
_basedir=binutils-$pkgver
validpgpkeys=("3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F")
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
