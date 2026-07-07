# Maintainer: JoveYu <yushijun110@126.com>

pkgname=orca-slicer-bin
pkgver=2.4.2
pkgrel=1
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
sha512sums=('90e7b535c100e2bd6dd9b5d6b2e20abde68770dee0aa6e2012d43f4ae722e5213ad65bebcd982bb071ef478486e22bc8c49a15d7dfd6ee4b862a14f93d41eeea')

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

  install -Dm644 squashfs-root/com.orcaslicer.OrcaSlicer.desktop ${pkgdir}/usr/share/applications/orca-slicer.desktop
  sed -i '/^Exec=/ c\Exec=/opt/orca-slicer/AppRun %U' ${pkgdir}/usr/share/applications/orca-slicer.desktop
  sed -i '/^MimeType=/ s|$|x-scheme-handler/orcaslicer;x-scheme-handler/bambustudio;|' ${pkgdir}/usr/share/applications/orca-slicer.desktop

  install -d ${pkgdir}/usr/share/icons/
  cp -r squashfs-root/usr/share/icons/hicolor/ ${pkgdir}/usr/share/icons/

  chmod +x ${pkgdir}/opt/orca-slicer/libexec/orca-slicer-env
}
