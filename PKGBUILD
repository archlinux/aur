# Maintainer: Igor Moura <imp2@cin.ufpe.br>

pkgname=freecad-appimage
pkgver=0.18_16146
_pkgver=0.18.4
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler (binary AppImage version)"
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
depends=('fuse2')
provides=("freecad=${_pkgver}")
conflicts=('freecad')
source=("https://github.com/FreeCAD/FreeCAD/releases/download/${_pkgver}/FreeCAD_${pkgver//_/-}-Linux-Conda_Py3Qt5_glibc2.12-${arch}.AppImage"
        freecad_conda.desktop.patch
        freecad.sh)
sha256sums=(SKIP
         '4ab2ff01c90be3a7d8eb90208bba27e5ee319bb39f0af13743d9fd7eee2a87fe'
         '97c04ffacbb6bc745fbdbdaae2e74a84370a7c07c187f516f9b2e22aaa03efac')
options=(!strip)
_filename=./FreeCAD_${pkgver//_/-}-Linux-Conda_Py3Qt5_glibc2.12-${arch}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  patch -Np0 < ./freecad_conda.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/freecad_conda.desktop" "${pkgdir}/usr/share/applications/freecad_conda.desktop"
}

# vim:set ts=2 sw=2 et:
