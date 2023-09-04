# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=freecad-appimage
pkgver=0.21.1
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler (AppImage version)"
arch=('x86_64')
url="https://www.freecad.org/"
license=('LGPL')
depends=('fuse2')
provides=('freecad')
conflicts=('freecad')
options=('!strip')
noextract=("freecad-${pkgver}.AppImage")
source=("freecad-${pkgver}.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/${pkgver}/FreeCAD_${pkgver}-Linux-x86_64.AppImage"
        "freecad.sh"
        "freecad-desktop.patch")
sha256sums=('9b8a991934e9d1edd7aa61b7ae938339e15b253ed612fe1f554abc1db9b6ee6f'
            '0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674'
            '63df64b9a480434b007e297e01f12ebbe49d8227c87de574110d8bf19f97f415')

prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract org.freecadweb.FreeCAD.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/mime/packages
  patch -Np0 <./freecad-desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"
  install -Dm644 "${srcdir}/squashfs-root/org.freecadweb.FreeCAD.desktop" "${pkgdir}/usr/share/applications/freecad.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/freecad.png" "${pkgdir}/usr/share/pixmaps/freecad.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecadweb.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
