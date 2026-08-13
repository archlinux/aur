# Maintainer: Evgeniy K. <genues@mail.ru>
# Original work by: Igor Moura <imp2@cin.ufpe.br>
pkgname=freecad-weekly-appimage
pkgver=1.2.0_2026.08.12
pkgrel=3
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
source=("freecad-1.2.0_2026.08.12.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/weekly-2026.08.12/FreeCAD_weekly-2026.08.12-Linux-x86_64.AppImage"
  "freecad.sh"
  "org.freecad.FreeCAD.desktop.patch")

sha256sums=(
  "1d6b52a5ebdec638263c273cea6af62194b76f81c0e2e721dd3af947e97ed0f7"
  "b0bcc6509274e19ace7d4a076c77d9af80d70a590bb46ad5ac3a57068e714d52"
  "cec2dab7f769f1c235c657dea36cdbdec5ad57d8db5ec57ee88db1cc75572fd5")
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


