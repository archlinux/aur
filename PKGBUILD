# Maintainer: Lucas Canonaco <canolucas@gmail.com>

pkgbase=nvidia-430xx-settings
pkgname=('nvidia-430xx-settings' 'libxnvctrl-430xx')
pkgver=430.40
pkgrel=1
pkgdesc='Tool for configuring the NVIDIA graphics driver, 430xx legacy branch'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
makedepends=('git' 'inetutils' 'jansson' 'gtk2' 'gtk3' 'libxv' 'libvdpau' 'nvidia-430xx-utils' 'libxext')
options=('staticlibs')
source=(nvidia-settings-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        libxnvctrl_so.patch
        0001-nvidia-settings-Make-VDPAUDeviceFunctions-static-to-.patch)
sha512sums=('7e21282a1d8f0f4096b779fa5d0ac984d5faaf1dc27e30ba65b033ec07490908ece1daf30a113f799979261454cfd57fc87260bddafd9f64df969ab06714f271'
            'f69f5dc84fe624579a3c9ce877f4ae4e34c2184877576afbea07b8abdd7ff01e470517f2b77cd11a904518cbcb83fb388ca1d08888006f0ef2854723920c9cf8'
            '0fd6355a10dfecb3636764f40eb0d4a4625f69e48fb653060f40e2bde8bf51eb04ae08be8751163d94e022c6f595a9756cde9d8404a556a4a83e3b5b74052c53')

prepare() {
  cd nvidia-settings-${pkgver}
  patch -p1 < "${srcdir}/libxnvctrl_so.patch"
  patch -p1 < "${srcdir}/0001-nvidia-settings-Make-VDPAUDeviceFunctions-static-to-.patch"
}

build() {
  # Set env variables
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  
  cd nvidia-settings-${pkgver}
  make
  make -C src/libXNVCtrl
}

package_nvidia-430xx-settings() {
  depends=('jansson' 'gtk3' 'libxv' 'libvdpau' 'nvidia-430xx-utils' 'libxnvctrl-430xx')
  conflicts=('nvidia-settings')
  provides=('nvidia-settings')

  cd nvidia-settings-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 doc/nvidia-settings.desktop "${pkgdir}/usr/share/applications/nvidia-settings.desktop"
  install -D -m644 doc/nvidia-settings.png "${pkgdir}/usr/share/pixmaps/nvidia-settings.png"
  sed -e 's:__UTILS_PATH__:/usr/bin:' -e 's:__PIXMAP_PATH__:/usr/share/pixmaps:' -e 's/__NVIDIA_SETTINGS_DESKTOP_CATEGORIES__/Settings;HardwareSettings;/' -i "${pkgdir}/usr/share/applications/nvidia-settings.desktop"

  rm "$pkgdir/usr/lib/libnvidia-gtk2.so.$pkgver"
}

package_libxnvctrl-430xx() {
  depends=('libxext')
  pkgdesc='NVIDIA NV-CONTROL X extension, 430xx legacy branch'
  provides=('libxnvctrl' 'libXNVCtrl.so')
  conflicts=('libxnvctrl')

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
