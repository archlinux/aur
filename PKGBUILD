# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=angular-electron-bin
_pkgname='Angular Electron'
pkgver=4.8.0
_pkgver=12.0.0
_electronversion=23
pkgrel=1
pkgdesc="Project intended to be used with SAP Service.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/malacration/sap-front"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=('gendesk')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${_pkgver}.tar.gz"
    #"LICENSE-${pkgver}.md::https://raw.githubusercontent.com/malacration/sap-front/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/malacration/sap-front/v${pkgver}/src/assets/icons/favicon.512x512.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('04afb012154146aa964276ff83800cc4416ed4c8f51aa9af35d9153415ddca64'
            'e88e5f0dc9ca423464c686e2100c7ff48e88474401f099086151a3b13be52c4b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${_pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${_pkgver}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
