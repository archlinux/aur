# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=upupup-bin
pkgver=0.0.5
_electronversion=32
pkgrel=2
pkgdesc="A small application that regularly reminds you to get up and stretch.(Prebuilt version.Use system-wide electron)一个定期提醒你起来活动筋骨的小应用"
arch=('x86_64')
url="https://github.com/unclemcz/upupup"
license=('CC0-1.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    #"LICENSE-${pkgver}.md::https://raw.githubusercontent.com/unclemcz/upupup/${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('6cba08ce3042821b66701db0f9676157e881f2136f235c61c98608bdb829a17d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}