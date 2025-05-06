# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hollama-bin
_pkgname=Hollama
pkgver=0.32.0
_electronversion=31
pkgrel=1
pkgdesc="A minimal web-UI for talking to Ollama servers.(Prebuilt version.Use system-wide electron)"
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
sha256sums=('69b3425b779c9b3c6023c9daf3b04add891af62222c7e756e5f7ba91338f41ed'
            '9e4e274319c0c5716601c69a701adce095b2248d7d314c2b4b1973f0ad4c4a20'
            '03ecf7aebc7db58685a433f3a0a126e1ac5329fb8a72f3af981957363a6362e6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_${pkgver}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_${pkgver}-linux-x64/resources/app.asar.unpacked"  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}