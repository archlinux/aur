# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rebaslight-bin
_pkgname=Rebaslight
pkgver=3.7.3
_electronversion=25
pkgrel=8
pkgdesc="An easy to use special effects editor.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="http://www.rebaslight.com/"
_ghurl="https://github.com/rebaslight/rebaslight"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/ffmpeg"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}