# Maintainer: SimonSystem <simon@simonsystem.de>
# Co-maintainer: smccloud <smccloud@smccloud.com>

pkgname=elegoo-slicer-bin
pkgver=1.5.3.4
pkgrel=1
pkgdesc="ElegooSlicer is an open-source slicer compatible with most FDM printers"
arch=('x86_64')
url="https://github.com/ELEGOO-3D/ElegooSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'gst-libav' 'gst-plugins-base' 'cairo' 'gtk3' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'webkit2gtk-4.1' 'mesa-utils')
provides=("elegoo-slicer")
conflicts=("elegoo-slicer")
options=(!strip !zipman !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ELEGOO-3D/ElegooSlicer/releases/download/v${pkgver}/ElegooSlicer_Linux_V${pkgver}.AppImage")
sha256sums=('5f7a31d6da5700f75d9b6aa0c8135a8cffdb210afd7f0eb59de7930104c5b323')

prepare() {
  chmod +x ${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
  install -d ${pkgdir}/opt/${pkgname%-bin}/
  cp -a squashfs-root/* ${pkgdir}/opt/${pkgname%-bin}/
  rm -rf ${pkgdir}/opt/${pkgname%-bin}/{usr,com.orcaslicer.ElegooSlicer.desktop,ElegooSlicer.png}

  install -d $pkgdir/usr/bin
  ln -s /opt/${pkgname%-bin}/AppRun ${pkgdir}/usr/bin/elegoo-slicer

  mv squashfs-root/com.orcaslicer.ElegooSlicer.desktop squashfs-root/ElegooSlicer.desktop
  install -Dm644 squashfs-root/ElegooSlicer.desktop -t ${pkgdir}/usr/share/applications/
  sed -i '/^Exec=/ c\Exec=/opt/elegoo-slicer/AppRun %U' ${pkgdir}/usr/share/applications/ElegooSlicer.desktop
  sed -i '/^MimeType=/ s|$|x-scheme-handler/orcaslicer;x-scheme-handler/bambustudio;|' ${pkgdir}/usr/share/applications/ElegooSlicer.desktop

  install -d ${pkgdir}/usr/share/icons/
  cp -r squashfs-root/usr/share/icons/hicolor/ ${pkgdir}/usr/share/icons/
}
