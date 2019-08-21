# Maintainer: Vinicius Correa <vinicius dot correa at zoho dot com>

_pkgname=krita
pkgname=${_pkgname}-appimage
pkgver=4.2.5
pkgrel=1
pkgdesc="Edit and paint images"
arch=('x86_64')
url="https://krita.org"
license=('GPL3')
provides=('krita')
conflicts=('krita')
source=("https://download.kde.org/stable/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}-${arch}.appimage"
        ${_pkgname}.sh)
sha256sums=('4f5202734aacd4fcd51aed4f3ed5cc776e0e404c699e0f92db62d57810a897da'
            'eaa8cc05d2d24d65254fffb1c88acc00511a0353fb8f9146027fc7debaf580ec')
options=(!strip)
_filename=./${_pkgname}-${pkgver}-${arch}.appimage

prepare() {
  cd "${srcdir}"
  chmod +x ${_filename}
  ${_filename} --appimage-extract
  rm ${srcdir}/squashfs-root/usr/share/icons/hicolor/icon-theme.cache
}

package() {
  install -Dm755 "${srcdir}/${_filename}" "${pkgdir}/opt/appimages/${_pkgname}.AppImage"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications/"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  cp --no-preserve=mode,ownership "${srcdir}/squashfs-root/org.kde.${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
