# Maintainer: František Fladung <ametisf@gmail.com>

_target_arch=arm
_target=${_target_arch}-android-eabi
pkgname=${_target}-linux-api-headers
pkgver=3.10.104
_basever=3.10
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=('any')
url="http://www.gnu.org/software/libc"
license=('GPL2')
source=(http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.xz
        http://www.kernel.org/pub/linux/kernel/v3.x/linux-${_basever}.tar.sign
        http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz
        http://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign)
md5sums=('4f25cd5bec5f8d5a7d935b3f2ccb8481'
         'SKIP'
         'aa652fb1c0da330e4e200877a9bc9d22'
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

  # use headers from libdrm
  rm -rf ${pkgdir}/usr/${_target}/include/drm

  # clean-up unnecessary files generated during install
  find ${pkgdir} \( -name .install -o -name ..install.cmd \) -delete
}
