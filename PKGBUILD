# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=3.1.6
_basever=3.1
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("kernel-headers=${pkgver}")
conflicts=('kernel-headers')
replaces=('kernel-headers')
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.xz
	http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz)
# NOTE: signatures are not automatically verified by makepkg
        #http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.sign
	#http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign
md5sums=('edbdc798f23ae0f8045c82f6fa22c536'
         'b59adeac6d593fe993e964ea9e259c42')

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
