# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tesladashcampro-bin
_pkgname=TeslaDashcamPro
pkgver=1.0.1
_electronversion=32
pkgrel=2
pkgdesc="A desktop application designed for viewing Tesla dashcam footage, with support for integrating and displaying vehicle CAN bus data.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/JustForFunOk/TeslaDashcamPro"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('22cc062b35caee06d4fbfdf61c1dab3acd8910f1e1d93e50d5e05688f058996e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}