# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=silence-speedup-bin
_pkgname="Silence-SpeedUp"
pkgver=1.2.5
_electronversion=16
pkgrel=8
pkgdesc="An electron-based app,speed-up your videos speeding-up (or removing) silences, using FFmpeg."
arch=("x86_64")
url="https://vincenzopadula.altervista.org/silence-speedup/"
_ghurl="https://github.com/padvincenzo/silence-speedup"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'ffmpeg'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('2f88c27b08084064ad8477f6744dc8592ea1d4bc5dba74437710871ece1d9653'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${_pkgname//-/ }|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo;Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-linux-x64/resources/app/assets/icons/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}