# Maintainer: John Regan <john@jrjrtech.com>
_pkgname=emoji-keyboard
_pkgver="3.1.0"
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
sha256sums_x86_64=('4c14ff6cb87dcc92059ccd95ff7ae337c3e01b811b823b0c26f4fee6490f76f2')
makedepends=('appimage')
conflicts=('emoji-keyboard')
provides=('emoji-keyboard')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
    mv squashfs-root "${_pkgname}-${_pkgver}.AppDir"
}

build() {
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname} --no-sandbox|" \
      "${_pkgname}-${_pkgver}.AppDir"/emoji-keyboard.desktop
    chmod -R a-x+rX "${_pkgname}-${_pkgver}.AppDir"/usr

    appimagetool -n "${_pkgname}-${_pkgver}.AppDir" "${_pkgname}"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/"${_pkgname}-${_pkgver}.AppDir"/emoji-keyboard.desktop" \
      "${pkgdir}/usr/share/applications/emoji-keyboard.desktop"

    for res in 16 24 32 48 64 128 256 ; do
        xres=${res}x${res}
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/icons/icon-${xres}.png" \
          "${pkgdir}/usr/share/icons/hicolor/${xres}/apps/emoji-keyboard.png"
    done

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/src/assets/icons/icon.svg" \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/emoji-keyboard.svg"
}
