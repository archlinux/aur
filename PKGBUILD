# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=thorium
pkgname="${_pkgname}-reader-bin"
_appname=Thorium
_fullname="${_appname}Reader"
pkgver=2.3.0
_electronversion=25
pkgrel=4
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
arch=('x86_64')
url="https://www.edrlab.org/software/thorium-reader/"
_ghurl="https://github.com/edrlab/thorium-reader"
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/EDRLab.${_fullname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/edrlab/thorium-reader/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1007cd9083715d32427e4d39f8a4cac69cf428cfc4521950571dc2290a308f23'
            'e95e504f42685015445b4a0a80dfdaa86e5b2b2c0e317bca2bcbb51330ec61e5'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|Name=${_appname}|Name=${_fullname}|g" \
        -e "s|/opt/${_appname}/${_pkgname}|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${_appname}/resources/app.asar.unpacked/external-assets/lcp.node" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}app.asar.unpacked/external-assets"
    for _icons in 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}