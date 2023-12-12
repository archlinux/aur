# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rebaslight-bin
_pkgname="Rebaslight"
pkgver=3.7.3
_electronversion=25
pkgrel=2
pkgdesc="An easy to use special effects editor"
arch=("x86_64")
url="http://www.rebaslight.com/"
_ghurl="https://github.com/rebaslight/rebaslight"
license=('AGPL3')
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
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/ffmpeg" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}