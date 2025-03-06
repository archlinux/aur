# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=space-snake-bin
_pkgname=Space-Snake
pkgver=0.11.1
_electronversion=4
pkgrel=10
pkgdesc="A Desktop game built with Electron and Vue.js.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ilyagru/Space-Snake"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/ilyagru/Space-Snake/${pkgver}/app/icons/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('b4ed62ff9b5dc3cc815f0ac5328dc602ce29f6bb3231beab622c246c7c2554f9'
            '2cf69008e16f9f81098eaed1b59e481bafb258606cc9171047db9b6fdec6cb9f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64-v${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64-v${pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}