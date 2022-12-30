# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=freecad-appimage
pkgver=0.20.2
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
source=("freecad-${pkgver}.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/0.20.2/FreeCAD_0.20.2-2022-12-27-conda-Linux-x86_64-py310.AppImage"
        "freecad.sh"
        "freecad_weekly.desktop.patch")
sha256sums=('4f0922cc0ef39fe8738b815b60bb3d5e0d4baced9ad026b442671d234cb14126'
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
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/default/freecad_weekly.png" "${pkgdir}/usr/share/pixmaps/freecad.png"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecadweb.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/freecad.xml"
}
