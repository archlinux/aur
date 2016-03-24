# Maintainer: camb <cyrilbur@gmail.com>
# This PKGBUILD was heavily inspired from the
# arm-linux-gnueabihf-linux-api-headers PKGBUILD

_target_arch=powerpc
_target=${_target_arch}-linux-gnu
pkgname=${_target}-linux-api-headers
_basever=4.4
pkgver=${_basever}.1
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=(http://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basever}.tar.xz
        http://www.kernel.org/pub/linux/kernel/v4.x/linux-${_basever}.tar.sign
        http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz
        http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign)
md5sums=('9a78fa2eb6c68ca5a40ed5af08142599'
         'SKIP'
         'd9e951895c8c249f0bf52d85f3e63bce'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

prepare() {
  cd ${srcdir}/linux-${_basever}
  [[ $pkgver != $_basever ]] && patch -p1 -i ${srcdir}/patch-${pkgver} || true
}

build() {
  cd ${srcdir}/linux-${_basever}

  make ARCH=${_target_arch} mrproper
  make ARCH=${_target_arch} headers_check
}

package() {
  cd ${srcdir}/linux-${_basever}
  make INSTALL_HDR_PATH=${pkgdir}/usr/${_target} ARCH=${_target_arch} headers_install

  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
