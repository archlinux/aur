# Maintainer: Nico <d3sox at protonmail dot com>
_pkgname=futo-notes
pkgname=${_pkgname}-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Fast, private, local-first notes"
arch=('x86_64')
url="https://notes.futo.tech"
license=('LicenseRef-SourceFirst-1.1')
depends=('hicolor-icon-theme' 'desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
_appimage="${pkgname}-${pkgver}-x86_64.AppImage"
source=("LICENSE.md::https://gitlab.futo.org/futo-notes/futo-notes/-/raw/main/LICENSE.md")
source_x86_64=("${_appimage}::https://gitlab.futo.org/api/v4/projects/488/packages/generic/${_pkgname}/v${pkgver}/FUTO-Notes-${pkgver}-x86_64.AppImage")
noextract=("${_appimage}")
sha256sums=('808950f8388f37b47a07217fbb90ef2e3512fd60abd492f1abe4ea1507857a8a')
sha256sums_x86_64=('6b1a162fcba802b11105e14d91b313b01dd87c27d8a925831964b21334de4c7a')

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
  install -Dm644 "squashfs-root/FUTO Notes.png" "${pkgdir}/opt/${_pkgname}/FUTO Notes.png"
  ln -s "usr/share/applications/FUTO Notes.desktop" "${pkgdir}/opt/${_pkgname}/FUTO Notes.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/usr/bin/env bash
exec /opt/${_pkgname}/AppRun "\$@"
EOF

  install -Dm644 "squashfs-root/usr/share/applications/FUTO Notes.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  sed -i \
    -e "s|^Exec=.*|Exec=${_pkgname}|" \
    -e 's|^Categories=.*|Categories=Office;Utility;|' \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  cp -a squashfs-root/usr/share/icons/hicolor/. "${pkgdir}/usr/share/icons/hicolor/"

  install -Dm644 "$srcdir/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
