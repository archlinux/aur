# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=colour-contrast-analyser-bin
_pkgname="Colour Contrast Analyser"
_appname=cca
pkgver=3.5.3
_electronversion=29
pkgrel=2
pkgdesc="Helps you determine the legibility of text and the contrast of visual elements, such as graphical controls and visual indicators."
arch=("x86_64")
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /-}-Setup-${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c152a5a93191aec52e0220e6e36aa1eb45c6abf5fc44bcdea18d9930704e870e'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|CCA|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"\/opt\/${_pkgname}\/${_appname}\"|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${_appname}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}