# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=2.6.34
_basever=2.6.34
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("kernel-headers=${pkgver}")
conflicts=("glibc<=2.10.1-4" 'kernel-headers')
replaces=('kernel-headers')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
	#http://www.kernel.org/pub/linux/kernel/v2.6/patch-${pkgver}.bz2
	scsi.patch)
md5sums=('10eebcb0178fb4540e2165bfd7efc7ad'
         'b6d05566fcfe07770d9386f0588f8758')

build() {
  cd ${srcdir}/linux-${_basever}
  #patch -Np1 -i ${srcdir}/patch-${pkgver}
  
  # fix issues with transition of scsi.h from glibc
  patch -Np1 -i ${srcdir}/scsi.patch

  make mrproper
  make headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr headers_install

  # use headers from libdrm
  rm -rf ${pkgdir}/usr/include/drm
  
  rm -f $(find ${pkgdir} -name .install -or -name ..install.cmd)
}
