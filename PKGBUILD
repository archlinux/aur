# Maintainer: Alonso Rodriguez <alonsorodi20 (at) gmail (dot) com>
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgbase=nvidia-390xx-settings
pkgname=('nvidia-390xx-settings' 'libxnvctrl-390xx')
pkgver=390.132
pkgrel=2
pkgdesc='Tool for configuring the NVIDIA graphics driver, 390xx legacy branch'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'inetutils' 'gtk2' 'jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-390xx-utils' 'libxext')
options=('staticlibs')
source=(nvidia-settings-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        libxnvctrl_so.patch)
sha512sums=('ad6836c8b002478fe7b76fb7df6b685686e73ba0849533f5d2c6cc0ca489f212556f309bc67870b2844921bfdb2c3c49300f35ee4d32e3d4c7f29c1ac9b0dd9a'
            'f69f5dc84fe624579a3c9ce877f4ae4e34c2184877576afbea07b8abdd7ff01e470517f2b77cd11a904518cbcb83fb388ca1d08888006f0ef2854723920c9cf8')

prepare() {
  cd nvidia-settings-${pkgver}
  patch -p1 < "${srcdir}/libxnvctrl_so.patch"
}

build() {
  # Set env variables
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  
  cd nvidia-settings-${pkgver}
  make
  make -C src/libXNVCtrl
}

package_nvidia-390xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-390xx-utils' 'libxnvctrl-390xx')
  conflicts=('nvidia-settings')
  provides=('nvidia-settings')

  cd nvidia-settings-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  rm "$pkgdir/usr/lib/libnvidia-gtk2.so.$pkgver"
}

package_libxnvctrl-390xx() {
  depends=('libxext')
  conflicts=('libxnvctrl')
  provides=('libxnvctrl')
  pkgdesc='NVIDIA NV-CONTROL X extension, 390xx legacy branch'

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
