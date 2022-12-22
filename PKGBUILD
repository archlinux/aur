# Maintainer: Evgeniy K. <genues@mail.ru>
# Original work by: Igor Moura <imp2@cin.ufpe.br>
pkgname=freecad-weekly-appimage
pkgver=0.20_31391
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler"
arch=('x86_64')
url="https://www.freecadweb.org/"
license=('LGPL')
depends=('fuse2')
provides=('freecad')
conflicts=('freecad')
options=('!strip')
noextract=("freecad-${pkgver}.AppImage")
source=("freecad-0.20_31391.AppImage::https://github.com/FreeCAD/FreeCAD-Bundle/releases/download/weekly-builds/FreeCAD_weekly-builds-31391-2022-12-22-conda-Linux-x86_64-py310.AppImage"
  "freecad.sh"
  "freecad_weekly.desktop.patch")

sha256sums=("SKIP"
  "0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674"
  "601666ea0b03f29bdae4dd43cfa8510d1beab10ce1f3f0a2f8eda0d5391f3fe8")
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

  install -dm755 "${pkgdir}/usr/share/"
  install -dm755 "${pkgdir}/usr/share/mime/packages"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecadweb.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/"

  install -Dm644 "${srcdir}/squashfs-root/freecad_weekly.desktop" "${pkgdir}/usr/share/applications/freecad_weekly.desktop"
}


