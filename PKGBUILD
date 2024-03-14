# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=owa-desktop-bin
pkgver=1.0.1
_electronversion=25
pkgrel=7
pkgdesc="A simple Outlook Web (Office 365) Desktop application, built using Electron.js"
arch=('x86_64')
url="https://github.com/mikepruett3/owa-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mikepruett3/owa-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('caa33aa8dab46de479837d3218598c30789a676dd5857ddd20ea22966a1adf32'
            '82f04c17c97a90cb676f7eec2bdeca09cfff8a6779b310226d8e750a70abad79'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}