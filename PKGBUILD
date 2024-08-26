# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hollama-bin
_pkgname=Hollama
pkgver=0.10.2
_electronversion=31
pkgrel=1
pkgdesc="A minimal web-UI for talking to Ollama servers"
arch=("x86_64")
url="https://hollama.fernando.is/"
_ghurl="https://github.com/fmaclen/hollama"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ollama'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/${_pkgname}_${pkgver}-linux-x64.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/fmaclen/hollama/${pkgver}/static/favicon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fmaclen/hollama/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('875ea198862449e21225b0921c3afb374cfa8c26dc72cb4907f2a92e6b32da4a'
            '9e4e274319c0c5716601c69a701adce095b2248d7d314c2b4b1973f0ad4c4a20'
            '03ecf7aebc7db58685a433f3a0a126e1ac5329fb8a72f3af981957363a6362e6'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}_${pkgver}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -r "${srcdir}/${_pkgname}_${pkgver}-linux-x64/resources/app.asar.unpacked"  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}