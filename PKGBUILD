# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jeroen Bollen <jbinero@gmail.com>

pkgname=x86_64-efi-pe-binutils
pkgver=2.29.1
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files for the x86_64 architecture in the Portable Executable format. "
url="http://www.gnu.org/software/binutils/"
arch=('x86_64')
license=('GPL')
depends=('zlib')
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz{,.sig})
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
md5sums=('acc9cd826edb9954ac7cecb81c727793'
         'SKIP')

_target="x86_64-efi-pe"

prepare() {
	cd ${srcdir}/binutils-${pkgver}

	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

	mkdir ${srcdir}/binutils-build
}

build() {
	cd ${srcdir}/binutils-build
	${srcdir}/binutils-${pkgver}/configure \
        --prefix=/usr \
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

	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}/usr/share/
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name "${_target}-*" -delete
}
