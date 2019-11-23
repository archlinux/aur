# Maintainer: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Contributor: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Original work by: Igor Moura <imp2@cin.ufpe.br>
pkgname=freecad-appimage-git
pkgver=0.19_18738
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

source=("freecad-${pkgver}.AppImage::https://github.com/FreeCAD/FreeCAD/releases/download/0.19_pre/FreeCAD_${pkgver//_/-}-Linux-Conda_Py3Qt5_glibc2.12-${arch}.AppImage"
        "freecad.sh"
        "freecad_conda.desktop.patch")

sha256sums=("60b41ee1e16740b059ade92d21afe14bc69630fa1cee545bd5fd15dafe58666e"
            "b052abcbbdb1f5c5743a576c96d83deadb19f490cbcbc1cf61c39cbeb62d1793"
            "927545a2aae158e95dcc16244d49fc124d7c0754a1b6362f7b0f1a27051d879e")

prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract freecad_conda.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons
  patch -Np0 < ./freecad_conda.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/freecad_conda.desktop" "${pkgdir}/usr/share/applications/freecad_conda.desktop"
}
