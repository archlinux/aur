# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=typesense-dashboard-bin
_pkgname="Typesense-Dashboard"
pkgver=1.6.1
_electronversion=28
pkgrel=2
pkgdesc="A Typesense Dashboard to manage and browse collections."
arch=('x86_64')
url="https://bfritscher.github.io/typesense-dashboard/"
_ghurl="https://github.com/bfritscher/typesense-dashboard"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-v${pkgver}.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/bfritscher/typesense-dashboard/v${pkgver}/public/icons/favicon-128x128.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('2dd03bede99216f534b34bd0d2278a8ae6f51b6b3953d0a95e465732bf0a1c2d'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${_pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/electron/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}