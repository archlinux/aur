# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=2.6.33.1
_basever=2.6.33
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL')
provides=("kernel-headers=${pkgver}")
conflicts=("glibc<=2.10.1-4" 'kernel-headers')
replaces=('kernel-headers')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
	http://www.kernel.org/pub/linux/kernel/v2.6/patch-${pkgver}.bz2
	scsi.patch)
md5sums=('c3883760b18d50e8d78819c54d579b00'
         '745fd1355c630e163e40c40d4c9b79f9'
         'b6d05566fcfe07770d9386f0588f8758')

build() {
  cd ${srcdir}/linux-${_basever}
  patch -Np1 -i ${srcdir}/patch-${pkgver} || return 1
  
  # fix issues with transition of scsi.h from glibc
  patch -Np1 -i ${srcdir}/scsi.patch || return 1

  make mrproper
  make headers_check || return 1
  make INSTALL_HDR_PATH=${pkgdir}/usr headers_install

  rm -rf ${pkgdir}/usr/include/drm
  
  rm -f $(find ${pkgdir} -name .install -or -name ..install.cmd)
}
