# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=elemntary-bin
pkgver=0.5.6
_electronversion=24
pkgrel=8
pkgdesc='A GUI application that allows your to control Wahoo Elemnt bicycle computers from a desktop PC providing some insights and hidden features.'
arch=('x86_64')
url="https://github.com/vti/elemntary"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'nodejs'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('b04a4f7f2801db40f4b02794c416890ca573254124b4c4a0b8c86b028fd607ae'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-x64/resources/app/src/ui/assets/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}