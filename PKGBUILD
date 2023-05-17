# Maintainer: Jérémy "Vrakfall" Lecocq <jeremy [dot] lecocq [at] protonmail [dot] com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgmainbranch=nvidia-settings
pkgbase=nvidia-525xx-settings
pkgname=('nvidia-525xx-settings' 'libxnvctrl-525xx')
pkgver=525.116.04
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver, 525 branch'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('inetutils' 'jansson' 'gtk3' 'libxv' 'libvdpau' "nvidia-utils=${pkgver}" 'libxext')
options=('staticlibs')
source=(${_pkgmainbranch}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('ff63dc50479022866f2e9bc8fba798b88fc819595517d839125dac1fb7e4c20f0027640c4dc7f7b0c544eba984190d4b204b4306ef36c55740681621be4e6fb3'
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

package_nvidia-525xx-settings() {
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

package_libxnvctrl-525xx() {
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
