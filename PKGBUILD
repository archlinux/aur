# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serina-bin
_pkgname=Serina
pkgver=0.4.0
_electronversion=24
pkgrel=3
pkgdesc="GUI for create translation files for i18next"
arch=('x86_64')
url="https://orn-fox.github.io/serina-1/"
_ghurl="https://github.com/ORN-Fox/serina-1"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/R${pkgver}/${pkgname%-bin}-${pkgver//./-}-linux-x64.zip"
    "${pkgname%-bin}".sh
)
sha256sums=('69d3988f02868299b31f974d1d3774431998a14a18e6469be0675211d290b524'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/resources/app/icons/icon-x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver//./-}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}