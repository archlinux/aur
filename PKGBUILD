# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=colour-contrast-analyser-bin
_pkgname='Colour Contrast Analyser'
_appname=cca
pkgver=3.5.5
_electronversion=35
pkgrel=1
pkgdesc="Helps you determine the legibility of text and the contrast of visual elements, such as graphical controls and visual indicators.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://www.paciellogroup.com/resources/contrastanalyser/"
_ghurl="https://github.com/ThePacielloGroup/CCAe"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /-}-Setup-${pkgver}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('0a72c5fe45a7c339078517f2a2ef321b165aa0293ebddd608e1566dac1b3f20d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/CCA/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}