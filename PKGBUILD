# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=somafm-desktop-player-bin
_pkgname="SomaFM Desktop Player"
pkgver=0.0.24
_electronversion=16
pkgrel=9
pkgdesc="SomaFM desktop player built with Electron and React.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://alechko.github.io/somafm-desktop-player/"
_ghurl="https://github.com/alechko/somafm-desktop-player"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/alechko/somafm-desktop-player/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('652b951c24390438e79858c328c646fc37b5bdf82e51e93baa4a57b8a93ba712'
            '5e404eae8a20b20c3e2ab7e0a08d04012d2cf8d5bf266849a22d7aa810409381'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Utility/AudioVideo/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/.webpack" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png" -t "${pkgdir}/usr/lib/${pkgname%-bin}/assets"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/assets/icon.png"  "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}