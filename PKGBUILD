# Maintainer: Nico <d3sox at protonmail dot com>
_pkgname=futo-notes
pkgname=${_pkgname}-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Fast, private, local-first notes"
arch=('x86_64')
url="https://notes.futo.tech"
license=('LicenseRef-FUTO')
depends=('hicolor-icon-theme' 'desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_appimage="${pkgname}-${pkgver}-x86_64.AppImage"
source_x86_64=("${_appimage}::https://gitlab.futo.org/api/v4/projects/488/packages/generic/${_pkgname}/v${pkgver}/FUTO-Notes-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('0ff9b19a803f285f92c6752f48024d8378421ae98c680c12ea4a89e0fb17dd74')

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a squashfs-root/usr "${pkgdir}/opt/${_pkgname}/"
  cp -a squashfs-root/apprun-hooks "${pkgdir}/opt/${_pkgname}/"
  install -Dm755 squashfs-root/AppRun "${pkgdir}/opt/${_pkgname}/AppRun"
  install -Dm755 squashfs-root/AppRun.wrapped "${pkgdir}/opt/${_pkgname}/AppRun.wrapped"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "squashfs-root/usr/share/applications/FUTO Notes.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i \
    -e "s|^Exec=.*|Exec=${_pkgname}|" \
    -e 's|^Categories=.*|Categories=Office;Utility;|' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  cp -a squashfs-root/usr/share/icons/hicolor/. "${pkgdir}/usr/share/icons/hicolor/"
}
