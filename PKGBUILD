# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=3.16.2
_basever=3.16
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.xz
        http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz)
        
        # NOTE: signatures are not automatically verified until pacman-4.2
        #http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.sign
        #http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign

md5sums=('5c569ed649a0c9711879f333e90c5386'
         '926e6e2ee0634ce53730701da749b040')

prepare() {
  cd ${srcdir}/linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -p1 -i ${srcdir}/patch-${pkgver}

  # fix xattr.h dual inclusion issues
  # https://github.com/torvalds/linux/commit/bfcfd44c
  sed -i "/__UAPI_DEF_XATTR/s/ifdef/if/" include/uapi/linux/xattr.h
}

build() {
  cd ${srcdir}/linux-${_basever}

  make mrproper
  make headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr headers_install

  # use headers from libdrm
  rm -r ${pkgdir}/usr/include/drm
  
  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
