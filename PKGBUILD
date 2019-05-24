# Maintainer: Igor Moura <imp2@cin.ufpe.br>

pkgname=freecad-appimage
pkgver=0.18_16117
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler (binary AppImage version)"
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
provides=('freecad')
conflicts=('freecad')
source=("https://github.com/FreeCAD/FreeCAD/releases/download/0.18.1/FreeCAD_${pkgver//_/-}-Linux-Conda_Py3Qt5_glibc2.12-${arch}.AppImage"
        freecad_conda.desktop.patch
        freecad.sh)
sha256sums=(SKIP
         'c56c0d1fd1d795419e464e487bab5fe2f62edb3ce40f895079d8251a9f6ddd1b'
         '9bfca97e1e633601ddfbd74f32501050f50378cfd6b30f5bf91d978e7ce33436')
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
