# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deskcal-bin
_appname=Deskcal
pkgver=1.0.6
_electronversion=20
pkgrel=8
pkgdesc="An unofficial cross-platform desktop Google Calendar application."
arch=('x86_64')
url="https://github.com/cognophile/Deskcal"
license=('GPL-3.0-only')
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}-linux-${pkgver}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('ab340f34a05895da69c61e1462b4b7d422e79b219633ed41f4e7d1a7ddf67d6a'
            'f80acf84a87f3f50d7c4e2ed22f4d0e8b09dd98a6c26253f2524e5413771eab1')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="Google ${_appname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources/app/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}