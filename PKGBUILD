# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=3.0.1
_basever=3.0
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("kernel-headers=${pkgver}")
conflicts=('kernel-headers')
replaces=('kernel-headers')
source=(http://www.kernel.org/pub/linux/kernel/v${_basever}/linux-${_basever}.tar.bz2
	http://www.kernel.org/pub/linux/kernel/v${_basever}/patch-${pkgver}.bz2)
md5sums=('398e95866794def22b12dfbc15ce89c0'
         'ac49f7907f1fc85fbab92d0f1aa1552a')

build() {
  cd ${srcdir}/linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -Np1 -i ${srcdir}/patch-${pkgver}

  make mrproper
  make headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr headers_install

  # use headers from libdrm
  rm -rf ${pkgdir}/usr/include/drm
  
  # clean-up unnecessary files generated during install
  find ${pkgdir} -name .install -or -name ..install.cmd | xargs rm -f
}
