# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=binggpt
pkgname="${_pkgname}-ee-bin"
_appname=BingGPT
pkgver=0.4.7
_electronversion=26
pkgrel=2
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
sha256sums=('50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('c51a2fd6705dc5bfe7b3cdebf6fd6daedade8be00fc5e8cbd0abc3ddbda20b16')
sha256sums_x86_64=('01dafcd9a29abc8e1960ce0a405bbaa7ca7612f353d9a0bac3ab439eec564839')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
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