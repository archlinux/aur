# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=2.6.36.2
_basever=2.6.36
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("kernel-headers=${pkgver}")
conflicts=('kernel-headers')
replaces=('kernel-headers')
source=(ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
	http://www.kernel.org/pub/linux/kernel/v2.6/patch-${pkgver}.bz2)
md5sums=('61f3739a73afb6914cb007f37fb09b62'
         '4b01c5f9657a9587b262df5f8d784116')

build() {
  cd ${srcdir}/linux-${_basever}
  patch -Np1 -i ${srcdir}/patch-${pkgver}

  make mrproper
  make headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr headers_install

  # use headers from libdrm
  rm -rf ${pkgdir}/usr/include/drm
  
  # clean-up unnecessary files generated during install
  rm -f $(find ${pkgdir} -name .install -or -name ..install.cmd)
}
