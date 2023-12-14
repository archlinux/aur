# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=typesense-dashboard-bin
_pkgname="Typesense-Dashboard"
pkgver=1.4.0
_electronversion=25
pkgrel=4
pkgdesc="A Typesense Dashboard to manage and browse collections."
arch=('x86_64')
url="https://bfritscher.github.io/typesense-dashboard/"
_ghurl="https://github.com/bfritscher/typesense-dashboard"
license=('GPL3')
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
sha256sums=('d7badb7fd7c3171893aadf3e26e7abae9da82e50498a27738f95de176ad169ca'
            'ce61a0d27e9167938ce2083e1391de1ee514b40d8a0f5c3602a7a04f449f6779'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/dist/electron/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}