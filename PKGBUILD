# Maintainer: JoveYu <yushijun110@126.com>
# Contributor: Poscat
# Contributor: sem.z <sem.z at protonmail dot com>

pkgname=orca-slicer-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="G-code generator for 3D printers"
arch=('x86_64')
url="https://github.com/SoftFever/OrcaSlicer"
license=('AGPL3')
depends=('mesa' 'glu' 'gst-libav' 'gst-plugins-base' 'cairo' 'gtk3' 'libsoup' 'webkit2gtk' 'gstreamer' 'openvdb' 'wayland' 'wayland-protocols' 'libxkbcommon' 'webkit2gtk-4.1')
provides=("orca-slicer")
conflicts=("orca-slicer")
options=(!strip !zipman !debug)
appimage="OrcaSlicer_Linux_AppImage_Ubuntu2404_V${pkgver}.AppImage"
source=("https://github.com/SoftFever/OrcaSlicer/releases/download/v${pkgver}/${appimage}")
sha512sums=('068059d73784a1e7bc2a72cc157a691bb61180a9045a59c6a61b42344cee0031731d29c140254a79433f18bd15e6b94d575a298f6cf0dda8d349c8b0591a65dc')

prepare() {
  chmod +x ${appimage}
  ./${appimage} --appimage-extract
}

package() {
  install -d ${pkgdir}/opt/${pkgname%-bin}/
  cp -av squashfs-root/* ${pkgdir}/opt/${pkgname%-bin}/
  rm -rf ${pkgdir}/opt/${pkgname%-bin}/usr/ ${pkgdir}/opt/${pkgname%-bin}/{OrcaSlicer.desktop,AppRun,OrcaSlicer.png}

  install -d $pkgdir/usr/bin
  ln -s /opt/${pkgname%-bin}/bin/orca-slicer ${pkgdir}/usr/bin/

  install -Dm644 squashfs-root/OrcaSlicer.desktop -t ${pkgdir}/usr/share/applications/
  sed -i 's|Exec=AppRun|Exec=/opt/orca-slicer/bin/orca-slicer|g' ${pkgdir}/usr/share/applications/OrcaSlicer.desktop

  install -d "${pkgdir}/usr/share/icons/"
  cp -r squashfs-root/usr/share/icons/hicolor/ "${pkgdir}/usr/share/icons/"
}
