# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Peter Jung <ptr1337@archlinux.org>
# Maintainer: NotFranko_ <notfranko@techlab.cloud>

pkgbase=nvidia-settings-bsb
pkgname=('nvidia-settings' 'libxnvctrl')
pkgver=590.48.01
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils-bsb' 'libxext' 'vulkan-headers')
options=('staticlibs')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('fdabed2f5f887f91c1a5bd49362f184ec602bcf0b098aa0af2f39c1cfaf9d050dfa7a22b5ad2afdb54e22f5169f75c2829619cf1f1bfc838a1c5d705dce0a23f'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out

  cd ${pkgbase}-${pkgver}
  patch -Np1 -i "${srcdir}"/nvidia-settings-libxnvctrl_so.patch
}

build() {
  cd ${pkgbase}-${pkgver}
  export CFLAGS+=" -ffat-lto-objects"
  make
}

package_nvidia-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils-bsb' 'libxnvctrl')

  cd ${pkgbase}-${pkgver}
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

package_libxnvctrl() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension'
  provides=('libXNVCtrl.so')

  cd ${pkgbase}-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -Dm 644 src/libXNVCtrl/*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr src/out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
