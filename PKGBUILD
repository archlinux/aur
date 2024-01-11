# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=realm-studio-bin
_pkgname="Realm Studio"
pkgver=14.1.2
_electronversion=24
pkgrel=2
pkgdesc='A tool, any developer or system administrator would use when building and maintaining their app built on the Realm Mobile Platform.'
arch=('x86_64')
url="https://realm.io/products/realm-studio/"
_ghurl="https://github.com/realm/realm-studio"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/realm/realm-studio/v${pkgver}/resources/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('927cbb21cf043d08218bcee442767fceeae9007ac182d4c191ec2f4ab2347abd'
            'b805ac8f6d254316eb3d5bb052d58e36054a933401e4f493af66e1c6cd2ed0fb'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}