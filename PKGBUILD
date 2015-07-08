# Maintainer: Jeroen Bollen <jbinero@gmail.com>

pkgname=x86_64-efi-pe-binutils
pkgver=2.24
pkgrel=0
pkgdesc="A set of programs to assemble and manipulate binary and object files for the x86_64 architecture in the Portable Executable format. "
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zlib')
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2{,.sig}
	binutils-2.24-lto-testsuite.patch
	binutils-2.24-shared-pie.patch)
md5sums=('e0f71a7b2ddab0f8612336ac81d9636b'
	'SKIP'
	'b16e895c24ff80acd98a21021eccefad'
	'ec59461c4febab9cfe1c1ef33326bc50')

_target="x86_64-efi-pe"

prepare() {
	cd ${srcdir}/binutils-${pkgver}
  
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
	
	# fix lto testsuite with gcc-4.9 - commit b35d44f1
	patch -p1 -i $srcdir/binutils-2.24-lto-testsuite.patch

	# fix issues with -static -fPIE -pie - commit 4199e3b8
	patch -p1 -i $srcdir/binutils-2.24-shared-pie.patch
  
	mkdir ${srcdir}/binutils-build
}

build() {
	cd ${srcdir}/binutils-build
	${srcdir}/binutils-${pkgver}/configure --prefix=/usr \
		--with-lib-path=/usr/lib:/usr/local/lib \
		--program-prefix=${_target}- \
		--target=${_target} --disable-werror

	# check the host environment and makes sure all the necessary tools are available
	make configure-host
	make tooldir=/usr
}

package() {
	cd ${srcdir}/binutils-build
	make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}/usr/share/
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name "${_target}-*" -delete
}
