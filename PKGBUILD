# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=thorium
pkgname="${_pkgname}-reader-bin"
_appname=Thorium
_fullname="${_appname}Reader"
pkgver=2.4.1
_electronversion=29
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
arch=('x86_64')
url="https://www.edrlab.org/software/thorium-reader/"
_ghurl="https://github.com/edrlab/thorium-reader"
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/EDRLab.${_fullname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/edrlab/thorium-reader/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('0abe6d51f68f35c3a6f664025aef4aee286b7cdebd2b769ed3169a882ec77508'
            'e95e504f42685015445b4a0a80dfdaa86e5b2b2c0e317bca2bcbb51330ec61e5'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
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