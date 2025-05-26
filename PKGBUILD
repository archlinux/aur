# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
_pkgname=apm
_appname='AviUtl Package Manager'
pkgver=3.9.1
_electronversion=33
pkgrel=2
pkgdesc="A software that assists in the installation of AviUtl itself and its plugins and scripts.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_ghurl="https://github.com/team-apm/apm"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('4e4c8ffb93f60a66f39fc1b33db2960e932809fda13ba10bdd156da9094ebf18'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/${_pkgname} %U/${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}