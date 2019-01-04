# Maintainer: Igor Moura <imp2@cin.ufpe.br>

pkgname=freecad-appimage
pkgver=0.17.13541.9948ee4
pkgrel=1
pkgdesc="A general purpose 3D CAD modeler (binary AppImage version)"
arch=('x86_64')
url='http://www.freecadweb.org/'
license=('LGPL')
provides=('freecad')
conflicts=('freecad')
source=("https://github.com/FreeCAD/FreeCAD/releases/download/0.17/FreeCAD-${pkgver}.glibc2.17-${arch}.AppImage"
        freecad.desktop.patch
        freecad.sh)
sha256sums=('ffbe93609f26ea38bcb019c17baa74264995d8b6b692e81ad07e73c7f763aa17'
         '7e3755f477d24f869408ac67ae75379b727464cc646b0a69ce86afe6e3ca9fef'
         '9bfca97e1e633601ddfbd74f32501050f50378cfd6b30f5bf91d978e7ce33436')
options=(!strip)
_filename=./FreeCAD-${pkgver}.glibc2.17-${arch}.AppImage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  patch -Np0 < ./freecad.desktop.patch
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/freecad.AppImage"
  install -Dm755 "${srcdir}/freecad.sh" "${pkgdir}/usr/bin/freecad"

  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  install -Dm644 "${srcdir}/squashfs-root/freecad.desktop" "${pkgdir}/usr/share/applications/freecad.desktop"
}

# vim:set ts=2 sw=2 et:
