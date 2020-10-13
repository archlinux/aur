# Maintainer: John Regan <john@jrjrtech.com>
_pkgname=emoji-keyboard
_pkgver="3.0.0-rc2"
pkgname="${_pkgname}-appimage"
pkgdesc="Virtual keyboard-like emoji palette for Linux - AppImage version"
pkgver="${_pkgver//-}"
pkgrel=1
arch=('x86_64')
url="https://github.com/OzymandiasTheGreat/emoji-keyboard"
license=('GPL')
options=(!strip)
_appimage="${_pkgname}-${_pkgver}.AppImage"
source=("https://github.com/OzymandiasTheGreat/emoji-keyboard/archive/v${pkgver}.tar.gz")
source_x86_64=("${_appimage}::https://github.com/OzymandiasTheGreat/emoji-keyboard/releases/download/v${pkgver}/${_appimage}")
noextract=("${_appimage}")
sha256sums=('SKIP') # github auto-generated archives are unreliable :-/
sha256sums_x86_64=('becfe7ebe4993ad10ec107e6aa0aa6a0c7d71bbed44d3c8af07c5ad0de55ce51')
makedepends=('appimage')
conflicts=('emoji-keyboard')
provides=('emoji-keyboard')

# Most of build() is to work around this issue: https://github.com/OzymandiasTheGreat/emoji-keyboard/issues/58
# Once resolved:
#    Makedepends can be removed
#    GitHub source can be removed

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    mv squashfs-root "${_pkgname}-${_pkgver}.AppDir"
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname} --no-sandbox|" \
      "${_pkgname}-${_pkgver}.AppDir"/emoji-keyboard.desktop
    chmod -R a-x+rX "${_pkgname}-${_pkgver}.AppDir"/usr

    for res in "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/usr/share/icons/hicolor"/*; do
        res="$(basename $res)"
        xres="${res%x*}"
        rm -f "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/usr/share/icons/hicolor/${res}/apps/emoji-keyboard.png"
        cp -a "${srcdir}/${_pkgname}-${pkgver}/src/assets/icons/icon-${xres}.png" \
          "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/usr/share/icons/hicolor/${res}/apps/emoji-keyboard.png"
    done

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/icons/icon.svg" \
      "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/usr/share/icons/scalable/apps/emoji-keyboard.svg"
    appimagetool -n "${_pkgname}-${_pkgver}.AppDir" "${_pkgname}"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/emoji-keyboard.desktop" \
      "${pkgdir}/usr/share/applications/emoji-keyboard.desktop"
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -a "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/usr/share/icons/hicolor" \
      "${pkgdir}/usr/share/icons/"
}
