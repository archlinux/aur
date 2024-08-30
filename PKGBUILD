# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=daily_diary
pkgname="${_appname//_/-}-bin"
_pkgname="Daily-Diary"
pkgver=1.4.3
pkgrel=3
pkgdesc="An app to create a diary entry every day"
arch=("x86_64")
url="https://github.com/Voklen/Daily-Diary"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Voklen/Daily-Diary/v${pkgver}/metadata/en-GB/images/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('d34fff1b1796c94403fb65ee30c507cf4348ef4d51d3caff1eda5acce809f538'
            'dc10c98253ebd96235ef66b2343a1f3a73a83d90ce7222fb81b8d5e79e6c341d'
            '463a6423f1107da6397bca9851047e08229cbe42028804dfce146359d541846e')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}/${_appname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}