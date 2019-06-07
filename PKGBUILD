# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgbase=nvidia-340xx-settings
pkgname=('nvidia-340xx-settings' 'libxnvctrl-340xx')
pkgver=340.107
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver, 340xx legacy branch'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'inetutils' 'gtk2' 'jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-340xx-utils' 'libxext')
options=('staticlibs')
source=(nvidia-settings-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        libxnvctrl_so.patch)
sha512sums=('5419aeac964345612d3933d2dd7249e8c18f9b1ce7fe8aa711d4ab54ba51505c3cf8caf24983fee7084ca8f2dc0be199236c99750038da12502bf91f83953899'
            '4d39721610adc54d272b0bbb4e9cd5edd29c0c1250c2ccb6c19927703bb3bc95fd826ffb24f3134af3ba0428f6fb400afeb9e3e1cb9b33f1ce59ea64885e5ddf')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  cd nvidia-settings-${pkgver}
  patch -p1 < "${srcdir}/libxnvctrl_so.patch"
}

build() {
  cd nvidia-settings-${pkgver}
  make
  make -C src/libXNVCtrl
}

package_nvidia-340xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-340xx-utils' 'libxnvctrl-340xx')
  conflicts=('nvidia-settings')
  provides=('nvidia-settings')

  cd nvidia-settings-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
}

package_libxnvctrl-340xx() {
  depends=('libxext')
  conflicts=('libxnvctrl')
  provides=('libxnvctrl')
  pkgdesc='NVIDIA NV-CONTROL X extension, 340xx legacy branch'

  cd nvidia-settings-${pkgver}
  install -Dm 644 doc/{NV-CONTROL-API.txt,FRAMELOCK.txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 samples/{Makefile,README,*.c,*.h,*.mk} -t "${pkgdir}/usr/share/doc/${pkgname}/samples"

  cd src/libXNVCtrl
  install -Dm 644 *.h -t "${pkgdir}/usr/include/NVCtrl"
  install -Dm 644 libXNVCtrl.a -t "${pkgdir}/usr/lib"
  install -Dm 755 libXNVCtrl.so.0.0.0 -t "${pkgdir}/usr/lib"
  ln -s libXNVCtrl.so.0.0.0 "${pkgdir}/usr/lib/libXNVCtrl.so.0"
  ln -s libXNVCtrl.so.0 "${pkgdir}/usr/lib/libXNVCtrl.so"
}

# vim: ts=2 sw=2 et:
