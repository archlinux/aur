# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=freecad-appimage
pkgver=1.0.2
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler (AppImage version)"
arch=('x86_64')
url="https://www.freecad.org/"
license=('LGPL-2.0-or-later')
depends=('fuse2')
provides=('freecad')
conflicts=('freecad')
options=('!strip')
noextract=("freecad-${pkgver}.AppImage")
source=("freecad-${pkgver}.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/${pkgver}/FreeCAD_${pkgver}-conda-Linux-x86_64-py311.AppImage"
        "freecad.sh"
        "freecad-desktop.patch")
sha256sums=('e00be00ad9fdb12b05c5002bfd1aa2ea8126f2c1d4e2fb603eb7423b72904f61'
            '0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674'
            'cf10eea11569a6799da888de9484d6e24021d805c8344075504a07d8f8331dfe')

prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract org.freecad.FreeCAD.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/mime
  patch -Np0 <./freecad-desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -Dm644 "${srcdir}/squashfs-root/org.freecad.FreeCAD.desktop" "${pkgdir}/usr/share/applications/freecad.desktop"

  for res in 16x16 32x32 48x48 64x64 scalable; do
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/$res/apps" "${srcdir}/squashfs-root/usr/share/icons/hicolor/$res/apps/org.freecad.FreeCAD."*
  done
  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes" "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/mimetypes/application-x-extension-fcstd.svg"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/org.freecad.FreeCAD.png" "${pkgdir}/usr/share/pixmaps/freecad.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecad.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/org.freecadweb.FreeCAD.xml"
}
