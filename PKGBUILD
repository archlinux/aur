# Maintainer: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Contributor: Bertrand Ciroux <bertrand.ciroux@gmail.com>
# Original work by: Igor Moura <imp2@cin.ufpe.br>
pkgname=freecad-appimage-git
pkgver=0.19_19020
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

# skip, since it changes every day
sha256sums=("SKIP"
            "0c5e634ad825f6eba37151fd1a12e496772874caad587fb009aa391984b87674"
            "93981010947cc386f31b07b3cf07921105d817974d3de291f32083d42af02b8e")

prepare() {
  cd "${srcdir}"
  chmod +x freecad-${pkgver}.AppImage
  ./freecad-${pkgver}.AppImage --appimage-extract freecad_conda.desktop
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/icons
  ./freecad-${pkgver}.AppImage --appimage-extract usr/share/mime/packages
  patch -Np0 < ./freecad_conda.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/freecad-${pkgver}.AppImage" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -dm755 "${pkgdir}/usr/share/"
  install -dm755 "${pkgdir}/usr/share/mime/application"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecadweb.FreeCAD.xml" "${pkgdir}/usr/share/mime/application/x-extension-fcstd.xml"

  install -Dm644 "${srcdir}/squashfs-root/freecad_conda.desktop" "${pkgdir}/usr/share/applications/freecad_conda.desktop"
}
