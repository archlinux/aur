# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=colour-contrast-analyser-bin
_pkgname="Colour Contrast Analyser"
_appname=cca
pkgver=3.5.4
_electronversion=31
pkgrel=1
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
sha256sums=('3d84896abbec26c914a2aae6a92f3f61ce5e444fb8e008e65a5bb7771fb12a83'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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