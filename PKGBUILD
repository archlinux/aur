# Maintainer: delta-whiplash <delta@delta-net.ovh>

# -------------------------------------------------------------------
# Naming convention:
#   pkgname  = zai-chat-desktop      (AUR / pacman convention: lowercase)
#   _appname = ZaiChatDesktop        (Pake app name: PascalCase)
#   _github  = delta-whiplash        (GitHub username - UPDATE THIS)
# -------------------------------------------------------------------
pkgname=zai-chat-desktop
_appname=ZaiChatDesktop
_github=delta-whiplash
pkgver=3.11.0
pkgrel=1
pkgdesc="Z.ai Desktop - AI Chatbot & Agent powered by GLM-5 & GLM-4.7"
arch=('x86_64')
url="https://chat.z.ai"
license=('MIT')
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator')
options=('!strip' '!debug')

# The .deb is built by the zai-chat-desktop repo via GitHub Actions
# Version matches Pake releases (e.g., 3.11.0)
# Note: filename uses lowercase with hyphens: zai-chat-desktop_V3.11.0_amd64.deb
source=(
    "${pkgname}-V${pkgver}.deb::https://github.com/${_github}/${pkgname}/releases/download/V${pkgver}/${pkgname}_V${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    bsdtar -xf "${pkgname}-V${pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"
}

package() {
    # Install binary
    install -Dm755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop file
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon
    if [[ -f "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png" ]]; then
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    elif [[ -f "${srcdir}/usr/lib/${pkgname}/png/${pkgname}_512.png" ]]; then
        install -Dm644 "${srcdir}/usr/lib/${pkgname}/png/${pkgname}_512.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
    fi

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
