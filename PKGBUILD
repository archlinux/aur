# Maintainer: Pablo Rodriguez <aur-contact@rodlop.net>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Peter Jung <ptr1337@archlinux.org>

_pkgbase=nvidia-settings
pkgbase=nvidia-610xx-settings
pkgname=('nvidia-610xx-settings' 'libxnvctrl-610xx')
pkgver=610.57.04
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver (610xx)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-610xx-utils' 'libxext' 'vulkan-headers')
options=('staticlibs')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('f7816f7007f8bf2d4cdb2d76690df6d41bfc356af157089376f5a45dd09529fdead1d20766e1ea558b566e229c7123e08db7f4317057175eeadd13d41ba0e247'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out

  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i "${srcdir}"/nvidia-settings-libxnvctrl_so.patch
}

build() {
  cd ${_pkgbase}-${pkgver}
  export CFLAGS+=" -ffat-lto-objects"
  make
}

package_nvidia-610xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-610xx-utils' 'libxnvctrl-610xx')
  provides=('nvidia-settings')
  conflicts=('nvidia-settings')

  cd ${_pkgbase}-${pkgver}
  DESTDIR="${pkgdir}" make install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed \
    -e 's:__UTILS_PATH__:/usr/bin:' \
    -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' \
    -e 's/__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__/Settings;HardwareSettings;/' \
    -e 's/Icon=.*/Icon=nvidia-settings/' \
    -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
}

package_libxnvctrl-610xx() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension (610xx)'
  provides=('libXNVCtrl.so' 'libxnvctrl')
  conflicts=('libxnvctrl')

  cd ${_pkgbase}-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -Dm 644 src/libXNVCtrl/*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr src/out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
