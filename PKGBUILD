# Maintainer: Jonathan Simon <jonathansimon@protonmail.com>

pkgname=orca-slicer-beta-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="G-code generator for 3D printers"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL-3.0-only')
depends=('glu' 'cairo' 'gtk3' 'gstreamer' 'wayland' 'webkit2gtk-4.1' 'mesa-utils' 'libmspack' 'libice' 'libsm')
provides=("orca-slicer")
conflicts=("orca-slicer" "orca-slicer-bin")
options=(!strip !zipman !debug)
appimage="OrcaSlicer_Linux_AppImage_Ubuntu2404_V${pkgver}-beta.AppImage"
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}-beta/${appimage}")
sha512sums=('8982c3de81e06b69d7843b269fbac93c8b68398b53479eb421fd21f772dc54873520cb134d64bf12cf9d87caec5caa70a0ebe76c60d0ad67a59b3cf400a5053b')

prepare() {
  chmod +x ${appimage}
  ./${appimage} --appimage-extract
}

package() {
  install -d ${pkgdir}/opt/${pkgname%-bin}/
  cp -a squashfs-root/* ${pkgdir}/opt/${pkgname%-bin}/
  rm -rf ${pkgdir}/opt/${pkgname%-bin}/{usr,com.orcaslicer.OrcaSlicer.desktop,OrcaSlicer.png}
  chmod 755 ${pkgdir}/opt/${pkgname%-bin}/libexec/orca-slicer-env

  install -d $pkgdir/usr/bin
  ln -s /opt/${pkgname%-bin}/AppRun ${pkgdir}/usr/bin/orca-slicer

  install -Dm644 squashfs-root/com.orcaslicer.OrcaSlicer.desktop -t ${pkgdir}/usr/share/applications/
  sed -i '/^Exec=/ c\Exec=/opt/orca-slicer-beta/AppRun %U' ${pkgdir}/usr/share/applications/com.orcaslicer.OrcaSlicer.desktop
  sed -i '/^MimeType=/ s|$|x-scheme-handler/orcaslicer;x-scheme-handler/bambustudio;|' ${pkgdir}/usr/share/applications/com.orcaslicer.OrcaSlicer.desktop

  install -d ${pkgdir}/usr/share/icons/
  cp -r squashfs-root/usr/share/icons/hicolor/ ${pkgdir}/usr/share/icons/
}
