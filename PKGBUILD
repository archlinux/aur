# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.10.0
pkgrel=1
pkgdesc="BitTorrent client ⚡. For mobile, desktop & server.(Prebuilt version)"
arch=('x86_64')
url="https://www.pikatorrent.com/"
_ghurl="https://github.com/G-Ray/pikatorrent"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'curl'
    'gtk3'
    'openssl'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/G-Ray/pikatorrent/v${pkgver}/assets/favicon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('4c238443156e29f8bb4dc09a388e4e68e9988b9c7a8f901fdcc983411c4f6526'
            '710f05cb6868daefc69ce9f974eafa4cef7f956cecc39d54b21d2a22a87f832e'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}