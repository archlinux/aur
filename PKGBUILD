# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rebaslight-bin
_pkgname="Rebaslight"
pkgver=3.7.3
_electronversion=25
pkgrel=5
pkgdesc="An easy to use special effects editor"
arch=("x86_64")
url="http://www.rebaslight.com/"
_ghurl="https://github.com/rebaslight/rebaslight"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.bz2"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/rebaslight/rebaslight/v${pkgver}/src/img/logo-transparent-100.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('d322a41100fcacb12658d3cef76ec21070081445d4f8868befa8c8edf267abd0'
            '62c76391a01e5d25c078cd65b2b0c78f39c756d041fef426043abfee38f0697c'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/ffmpeg" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}