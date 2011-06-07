# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=2.6.39.1
_basever=2.6.39
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("kernel-headers=${pkgver}")
conflicts=('kernel-headers')
replaces=('kernel-headers')
source=(http://www.kernel.org/pub/linux/kernel/v2.6/linux-${_basever}.tar.bz2
	http://www.kernel.org/pub/linux/kernel/v2.6/patch-${pkgver}.bz2)
md5sums=('1aab7a741abe08d42e8eccf20de61e05'
         '215f7ebaafe1175dbc5d1e439c9a96d5')

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
