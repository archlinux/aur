# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pedax-bin
pkgver=6.59.0
_subver=155
pkgrel=1
pkgdesc="Reversi Board with edax, which is the strongest reversi engine."
arch=("x86_64")
url="https://sensuikan1973.github.io/pedax/"
_ghurl="https://github.com/sensuikan1973/pedax"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/${pkgver}%2B${_subver}/${pkgname%-bin}-ubuntu-latest.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('f517fd742a791561227af64597a0758c434b4f94d70c9888fcbfb22e67a2efbd'
            '463a6423f1107da6397bca9851047e08229cbe42028804dfce146359d541846e')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/images/${pkgname%-bin}_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}