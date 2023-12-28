# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=guiwrapper-bin
_pkgname=GUIwrapper
pkgver=0.7.3
_electronversion=23
pkgrel=7
pkgdesc="A simple cross platform graphical user interface (GUI) wrapper to launch executable desktop applications"
arch=('x86_64')
url="https://github.com/frodal/GUIwrapper"
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
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/frodal/GUIwrapper/v${pkgver}/assets/icons/png/512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('9fe4cd794aae62af8867149fe22a05859b03974871963bf37f9617556ebaf085'
            'c2655948673313ef780c59ed39d9cc8d7db09929330223d44e8014f0860435ba'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}