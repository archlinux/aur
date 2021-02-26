# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=('nvidia-settings-gtk2' 'libxnvctrl-gtk2')
pkgver=460.56
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('jansson' 'gtk2')
makedepends=('git' 'inetutils' 'gtk2' 'jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-utils' 'libxext' 'libxnvctrl')
options=('staticlibs')
source=(nvidia-settings-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
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

package_nvidia-settings-gtk2() {
  provides=(nvidia-settings)
  conflicts=(nvidia-settings)
  cd nvidia-settings-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  rm "$pkgdir/usr/lib/libnvidia-gtk3.so.$pkgver"
}

package_libxnvctrl-gtk2() {
  pkgdesc='NVIDIA NV-CONTROL X extension'
  provides=('libxnvctrl' 'libXNVCtrl.so')
  conflicts=('libxnvctrl')

  cd nvidia-settings-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  cd src/libXNVCtrl
  install -Dm 644 ./*.h -t "${pkgdir}/usr/include/NVCtrl"
  install -d "${pkgdir}/usr/lib"
  cp -Pr out/libXNVCtrl.* -t "${pkgdir}/usr/lib"
}

# vim: ts=2 sw=2 et:
