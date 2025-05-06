# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=silence-speedup-bin
_pkgname='Silence-SpeedUp'
pkgver=2.0.0
_electronversion=34
pkgrel=1
pkgdesc="An electron-based app,speed-up your videos speeding-up (or removing) silences, using FFmpeg.(Prebuilt version.Use system-wide electron)"
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
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('9d688e579f7c8f05007b7f10aeb9aa31e49fdd74a46fd2c260db4a7ddc6e20b2'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname//-/ }/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/${_pkgname}-linux-x64/resources/app/assets/ffmpeg/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/assets/icons/icon.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}