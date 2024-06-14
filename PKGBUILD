# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=binggpt
pkgname="${_pkgname}-ee-bin"
_appname=BingGPT
pkgver=0.4.8
_electronversion=26
pkgrel=1
pkgdesc="BingGPT Enhanced Editon - Desktop application of new Bing's AI-powered chat.A rewritten version."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/fangkehou-team/BingGPT_Enhanced_Editon"
license=("Apache-2.0")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-desktop"
    "${pkgname%-bin}"
)
provides=("${_pkgname}-desktop")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_appname}-Linux-arm64-${pkgver}.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_appname}-Linux-amd64-${pkgver}.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('5ffdba0fdecb741422b8487fe0c32b406e402026b2bfb5b8cb0fcec149aa45ff')
sha256sums_x86_64=('d5f5cef1d7d8a138cebe6316cb1a13963381c8e4f4f1e5cfe7316ab4430eea7e')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|\"/opt/${_chsname}/${_appname}\"|${pkgname%-bin}|g" \
        -e "s|/opt/${_appname}/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
            -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}