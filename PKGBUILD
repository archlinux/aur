# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pikatorrent-bin
_pkgname=PikaTorrent
pkgver=0.13.0
pkgrel=1
pkgdesc="BitTorrent client ⚡. For mobile, desktop & server.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.pikatorrent.com/"
_ghurl="https://github.com/G-Ray/pikatorrent"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'curl'
    'gtk3'
    'openssl'
    'mpv'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/G-Ray/pikatorrent/v${pkgver}/assets/favicon.png"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.zip")
sha256sums=('8310a77ea2a7bbb3fdfeba4b073d59cc54b8e40d553ec4553d0bd668cc4b931a'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('9c15d91700bee29a68981c2f4f97e2309708b34fbfce580bf7cc99835e4a56d7')
sha256sums_x86_64=('25e22a4461341dc866d593cf2cc96b034dbe37c144213ae8978c36b36742e40d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}