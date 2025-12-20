# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Peter Jung <ptr1337@archlinux.org>

pkgbase=nvidia-580xx-settings
pkgname=('nvidia-580xx-settings' 'libxnvctrl-580xx')
pkgver=580.119.02
pkgrel=2
pkgdesc='Tool for configuring the NVIDIA graphics driver (580xx)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL-2.0-only')
makedepends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-580xx-utils' 'libxext' 'vulkan-headers')
options=('staticlibs')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('9572a854cf5c97e79ad879fd6b9b1303443cbc1744a1fb57f8cce57a0759e83a56495840a48735551092986f0d1266bb83f501f44e1661b507b6c557ca9fdebb'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  cd "nvidia-settings-${pkgver}"
  patch -Np1 -i "${srcdir}/nvidia-settings-libxnvctrl_so.patch"
}

build() {
  cd "nvidia-settings-${pkgver}"

  export CFLAGS+=" -ffat-lto-objects"
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out
  export PREFIX=/usr

  make
}

package_nvidia-580xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxnvctrl-580xx')
  provides=('nvidia-settings')
  conflicts=('nvidia-settings')

  cd "nvidia-settings-${pkgver}"
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

package_libxnvctrl-580xx() {
  pkgdesc='NVIDIA NV-CONTROL X extension (580xx)'
  depends=('libxext')
  provides=('libXNVCtrl.so' 'libxnvctrl')
  conflicts=('libxnvctrl')

  cd "nvidia-settings-${pkgver}"
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  install -Dm 644 src/libXNVCtrl/*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr src/out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
