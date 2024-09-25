# Based on: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: nizne <nizne at tutamail dot com>

_pkgname=paperlib
_Pkgname=Paperlib

pkgname="${_pkgname}"-appimage
pkgver=3.1.9
pkgrel=2
pkgdesc="An open-source and simple academic paper management tool."
arch=('x86_64')
url="https://github.com/Future-Scholars/paperlib"
license=('GPL-3.0-or-later')
depends=('libsecret' 'fuse2')
options=(!strip)
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::${url}/releases/download/release-electron-${pkgver}/${_Pkgname}_${pkgver}.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('0457f6ca8f2bb5fcb9765ee2d6111185d6dbff86ff1915c49d378f81c1cb12b2')
prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    "squashfs-root/${_pkgname}.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
