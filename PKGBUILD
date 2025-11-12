# Maintainer: Evgeniy K. <genues@mail.ru>
# Original work by: Igor Moura <imp2@cin.ufpe.br>
pkgname=freecad-weekly-appimage
pkgver=1.1.0_2025.11.12
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler"
arch=('x86_64')
url="https://www.freecad.org/"
license=('LGPL')
depends=('fuse2')
makedepends=('patch' 'adwaita-icon-theme')
provides=('freecad')
conflicts=('freecad')
options=('!strip' '!debug')
noextract=("freecad-${pkgver}.AppImage")
source=("freecad-1.1.0_2025.11.12.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/weekly-2025.11.12/FreeCAD_weekly-2025.11.12-Linux-x86_64-py311.AppImage"
  "freecad.sh"
  "org.freecad.FreeCAD.desktop.patch")

sha256sums=(
  "e147d7c03fc0c2e6875dcd522b9e592f00039aca13e82966b58cd79c18056e52"
  "0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674"
  "52085d2850053db11009365ebdc164e7764f52c3b0d00add4a3d8d8c82860174")
prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract org.freecad.FreeCAD.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/mime/packages

  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons/hicolor
  rm squashfs-root/usr/share/icons/hicolor/index.theme

  patch -Np0 <./org.freecad.FreeCAD.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -dm755 "${pkgdir}/usr/share/"
  install -dm755 "${pkgdir}/usr/share/mime/packages"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecad.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/"

  install -Dm644 "${srcdir}/squashfs-root/org.freecad.FreeCAD.desktop" "${pkgdir}/usr/share/applications/org.freecad.FreeCAD.desktop"
}


