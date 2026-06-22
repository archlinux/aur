# Maintainer: JoveYu <yushijun110@126.com>

pkgname=orca-slicer-bin
pkgver=2.4.0
pkgrel=2
pkgdesc="G-code generator for 3D printers"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('glu' 'cairo' 'gtk3' 'gstreamer' 'gst-plugins-good'
         'wayland' 'webkit2gtk-4.1' 'mesa-utils' 'libmspack'
         'libice' 'libsm')
provides=("orca-slicer")
conflicts=("orca-slicer")
options=(!strip !zipman !debug)
appimage="OrcaSlicer_Linux_AppImage_Ubuntu2404_V${pkgver}.AppImage"
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/${appimage}")
sha512sums=('388390b1b0237dc4e1d22ac2147f358803ad0b6308ee1b3f946283b7e149435011d2d58ddfd7193b7dda11803bcd394cc93eb6cc9e03b4c44d78985f3a7e4d3b')

prepare() {
  chmod +x ${appimage}
  ./${appimage} --appimage-extract
}

package() {
  install -d ${pkgdir}/opt/${pkgname%-bin}/
  cp -a squashfs-root/* ${pkgdir}/opt/${pkgname%-bin}/
  rm -rf ${pkgdir}/opt/${pkgname%-bin}/{usr,com.orcaslicer.OrcaSlicer.desktop,OrcaSlicer.png}

  install -d $pkgdir/usr/bin
  ln -s /opt/${pkgname%-bin}/AppRun ${pkgdir}/usr/bin/orca-slicer

  install -Dm644 squashfs-root/com.orcaslicer.OrcaSlicer.desktop -t ${pkgdir}/usr/share/applications/
  sed -i '/^Exec=/ c\Exec=/opt/orca-slicer/AppRun %U' ${pkgdir}/usr/share/applications/com.orcaslicer.OrcaSlicer.desktop
  sed -i '/^MimeType=/ s|$|x-scheme-handler/orcaslicer;x-scheme-handler/bambustudio;|' ${pkgdir}/usr/share/applications/com.orcaslicer.OrcaSlicer.desktop

  install -d ${pkgdir}/usr/share/icons/
  cp -r squashfs-root/usr/share/icons/hicolor/ ${pkgdir}/usr/share/icons/
}
