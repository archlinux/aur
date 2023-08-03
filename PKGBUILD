# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=freecad-appimage
pkgver=0.21.0
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
source=("freecad-${pkgver}.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/0.21.0/FreeCAD_0.21.0-Linux-x86_64.AppImage"
        "freecad.sh"
        "freecad_weekly.desktop.patch")
sha256sums=('7ac2970c201bae4eb31459b9c7788b521aa3df468291b4b169a3c04132853e9b'
            '0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674'
            'bec9eeb54790ebcd3c9954bf014ab24c5eaabcdb1ed6a9b4043b8acc6b3762c2')

prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract freecad_weekly.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/mime/packages
  patch -Np0 <./freecad_weekly.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"
  install -Dm644 "${srcdir}/squashfs-root/freecad_weekly.desktop" "${pkgdir}/usr/share/applications/freecad.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/64x64/apps/freecad.png" "${pkgdir}/usr/share/pixmaps/freecad.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecadweb.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
