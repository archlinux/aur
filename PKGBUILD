# Maintainer: archeese

_pkgmainbranch=nvidia-settings
pkgbase=nvidia-535xx-settings
pkgname=('nvidia-535xx-settings' 'libxnvctrl-535xx')
pkgver=535.216.01
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver, 535 branch'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('inetutils' 'jansson' 'gtk3' 'libxv' 'libvdpau' "nvidia-utils=${pkgver}" 'libxext')
options=('staticlibs')
source=(${_pkgmainbranch}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('f405cf28f639a141bc93e01dbda6a3d173f7a17a6a697ef352583a4fe376b95a028d0dfd506ce2c74f8c2c80fa2bbba96992eb993d59325668f619d37d7f5166'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  cd ${_pkgmainbranch}-${pkgver}
  patch -Np1 -i "${srcdir}"/nvidia-settings-libxnvctrl_so.patch
}

build() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out

  cd ${_pkgmainbranch}-${pkgver}
  export CFLAGS+=" -ffat-lto-objects"
  make
}

package_nvidia-535xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' "nvidia-utils=${pkgver}" "libxnvctrl=${pkgver}")
  conflicts=('nvidia-settings')
  provides=("nvidia-settings=${pkgver}")

  cd ${_pkgmainbranch}-${pkgver}
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

package_libxnvctrl-535xx() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension'
  conflicts=('libxnvctrl')
  provides=("libxnvctrl=${pkgver}" 'libXNVCtrl.so')

  cd ${_pkgmainbranch}-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -Dm 644 src/libXNVCtrl/*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"

  cp -Pr src/out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}
