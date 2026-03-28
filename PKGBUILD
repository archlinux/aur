# Maintainer: delta-whiplash <delta@delta-net.ovh>

# -------------------------------------------------------------------
# Naming convention:
#   pkgname    = zai-chat-desktop      (AUR / pacman convention: lowercase)
#   _appname   = ZaiChatDesktop        (Pake app name: PascalCase)
#   _binaryname= zaichatdesktop        (Pake converts to lowercase, no hyphens)
#   _github    = delta-whiplash        (GitHub username)
# -------------------------------------------------------------------
pkgname=zai-chat-desktop
_appname=ZaiChatDesktop
_binaryname=zaichatdesktop
_github=delta-whiplash
pkgver=3.11.0
pkgrel=4
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

    # Patch desktop file to use correct binary, icon and description
    sed -i "s|Exec=pake-${_binaryname}|Exec=${pkgname}|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
    sed -i "s|StartupWMClass=pake-${_binaryname}|StartupWMClass=${pkgname}|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
    sed -i "s|Icon=pake-${_binaryname}|Icon=${pkgname}|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
    sed -i "s|Name=${_binaryname}|Name=Z.ai Desktop|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
    sed -i "s|Comment=.*|Comment=AI Chatbot \& Agent powered by GLM-5 \& GLM-4.7|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
    sed -i "s|Categories=|Categories=Network;Chat;Office;|g" "${srcdir}/usr/share/applications/${_binaryname}.desktop"
}

package() {
    # Install binary (Pake names it pake-zaichatdesktop)
    install -Dm755 "${srcdir}/usr/bin/pake-${_binaryname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop file (Pake names it zaichatdesktop.desktop)
    install -Dm644 "${srcdir}/usr/share/applications/${_binaryname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon (Pake names it pake-zaichatdesktop.png)
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_binaryname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Also install to pixmaps for broader compatibility (KDE, etc.)
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake-${_binaryname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
