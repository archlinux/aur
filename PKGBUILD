# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=('nvidia-settings-beta-gtk2' 'libxnvctrl-beta-gtk2')
pkgver=465.19.01
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('inetutils' 'jansson' 'gtk2' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxext')
options=('staticlibs')
source=(https://github.com/NVIDIA/nvidia-settings/archive/refs/tags/${pkgver}.tar.gz
        libxnvctrl_so.patch)
sha512sums=('SKIP'
            'SKIP')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out
  cd nvidia-settings-${pkgver}
  patch -p0 < "${srcdir}/libxnvctrl_so.patch"
}

build() {
  cd nvidia-settings-${pkgver}
  make
  make -C src/libXNVCtrl
}

package_nvidia-settings-beta-gtk2() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxnvctrl')
  provides=(nvidia-settings nvidia-settings-beta)
  conflicts=(nvidia-settings nvidia-settings-beta)

  cd nvidia-settings-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -e 's/__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__/Settings;HardwareSettings;/' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  rm "$pkgdir/usr/lib/libnvidia-gtk3.so.$pkgver"
}

package_libxnvctrl-beta-gtk2() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension'
  provides=('libXNVCtrl.so' 'libxnvctrl' 'libxnvctrl-beta')
  conflicts=(libxnvctrl libxnvctrl-beta)

  cd nvidia-settings-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  cd src/libXNVCtrl
  install -Dm 644 ./*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
