# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Sukanka <su975853527 [AT] gmail.com>
pkgname=yank-note-bin
_pkgname=Yank-Note
pkgver=3.70.3
_electronversion=28
pkgrel=1
pkgdesc='A Hackable Markdown Note Application for Programmers'
arch=(
    'aarch64'
    'x86_64'
)
url="https://yank-note.com/"
_ghurl="https://github.com/purocean/yn"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'python'
)
options=('!strip')
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64-${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-amd64-${pkgver}.deb")
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('a2e85a3fed7e085c9dad326afcb5d87092d160c870fef1bda1b33a09e70f4eae')
sha256sums_x86_64=('320c631aaa964894830528b0da118dae9401f4ec49ea63e982af477b2f728979')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|yank.note|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname//-/ }/${pkgname%-bin}\"|${pkgname%-bin}|g;s|Markdown;|Utility;|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname//-/ }/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}