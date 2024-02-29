# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=homeassistant-desktop-bin
pkgver=1.0.0
_electronversion=23
pkgrel=6
pkgdesc="A simple Home Assistant Desktop application, built using Electron.js"
arch=('x86_64')
url="https://github.com/mikepruett3/homeassistant-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mikepruett3/homeassistant-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('171da8182923ab927c0b26e9dbc7dac1e1798e7f8012fb3b3bed0d09c81b0b82'
            '82f04c17c97a90cb676f7eec2bdeca09cfff8a6779b310226d8e750a70abad79'
            'f80acf84a87f3f50d7c4e2ed22f4d0e8b09dd98a6c26253f2524e5413771eab1')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
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