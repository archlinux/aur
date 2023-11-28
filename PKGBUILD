# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=newpad-bin
_pkgname=NewPad
pkgver=1.3.0
pkgrel=1
pkgdesc="An OblivionOcean Software, Bro.高颜值、易上手的Markdown记事本"
arch=("x86_64")
url="https://github.com/OblivionOcean/NewPad"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
)
makedepends=(
    'asar'
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/linux.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OblivionOcean/NewPad/${pkgver}/License"
    "${pkgname%-bin}.sh"
)
sha256sums=('cf2934d09001055e05fbf6bcdfdfd355ef6c5ca96f8419da0a2b18f1368f152a'
            '5950cbd8232f1a8804591dd285cf0c27a9b5078c2d2d51030972b334664889d4'
            '88c08a089e6c6d073fec6010efc67916ec06e3f380f42c5326d4ab129605dd41')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    asar e "${srcdir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    convert "${srcdir}/app.asar.unpacked/logo.ico" "${srcdir}/app.asar.unpacked/logo.png"
    cp "${srcdir}/app.asar.unpacked/logo-3.png" "${srcdir}/app.asar.unpacked/logo.png"
    sed "s|logo.ico|logo.png|g" -i "${srcdir}/app.asar.unpacked/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/app.asar.unpacked/logo-6.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}