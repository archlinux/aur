# Maintainer: SimonSystem <simon@simonsystem.de>
# Co-maintainer: smccloud <smccloud@smccloud.com>

pkgname=elegoo-slicer-bin
pkgver=1.5.3.5
pkgrel=2
pkgdesc="ElegooSlicer is an open-source slicer compatible with most FDM printers"
arch=('x86_64')
url="https://github.com/ELEGOO-3D/ElegooSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'gst-libav' 'gst-plugins-base' 'cairo' 'gtk3' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'webkit2gtk-4.1' 'mesa-utils')
provides=("elegoo-slicer")
conflicts=("elegoo-slicer")
options=(!strip !zipman !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ELEGOO-3D/ElegooSlicer/releases/download/v${pkgver}/ElegooSlicer_Linux_V${pkgver}.AppImage")
sha256sums=('7b3b3f08e0d0d51bb472c85865d1be9b0c28385423daba1cb0c3b225d0101afc')

prepare() {
  chmod +x ${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
  cd "$srcdir/../"
  install -d ${pkgdir}/opt/${pkgname%-bin}/
  cp -a ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname%-bin}/
  rm -rf ${pkgdir}/opt/${pkgname%-bin}/{usr,com.orcaslicer.ElegooSlicer.desktop}

  install -d $pkgdir/usr/bin
  ln -s /opt/${pkgname%-bin}/AppRun ${pkgdir}/usr/bin/elegoo-slicer

  mv ${srcdir}/squashfs-root/com.orcaslicer.ElegooSlicer.desktop ${srcdir}/squashfs-root/ElegooSlicer.desktop
  install -Dm644 ${srcdir}/squashfs-root/ElegooSlicer.desktop -t ${pkgdir}/usr/share/applications/
  sed -i '/^Exec=/ c\Exec=/opt/elegoo-slicer/AppRun %U' ${pkgdir}/usr/share/applications/ElegooSlicer.desktop
  sed -i 's|Icon=ElegooSlicer|Icon=/opt/elegoo-slicer/ElegooSlicer.png|g' ${pkgdir}/usr/share/applications/ElegooSlicer.desktop
  sed -i '/^MimeType=/ s|$|x-scheme-handler/orcaslicer;x-scheme-handler/bambustudio;|' ${pkgdir}/usr/share/applications/ElegooSlicer.desktop
}
