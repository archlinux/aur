# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rats-search-bin
_pkgname=RatsSearch
pkgver=2.0.0
pkgrel=1
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/librats/rats-search"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'qt6-websockets'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-x64.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/librats/rats-search/v${pkgver}/resources/icons/512x512.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/librats/rats-search/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7cf7f86c3a938beff79a0b135e7066d1b41ee32f0988bcfb0db5148d85e8c630'
            '7b3059f3e7c9bfe79a9c6e0c562a4c7ecea82e9a8f79c29ec1c5b03c49b23ac5'
            'fa6a25af037d88ee811669579da9674e5694611599600b11e691115054f6fe2f'
            'db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-Linux-x64/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}