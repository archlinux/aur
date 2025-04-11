# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lyrically-bin
_pkgname=Lyrically
pkgver=0.4.0
_electronversion=35
pkgrel=1
pkgdesc="Music player inspired by Lyric Speaker.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/CyanSalt/lyrically"
license=('ISC')
conflits=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.zip"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/resources/images/icon.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/CyanSalt/lyrically/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c379a0625ed7e1ef8c867af8b57049bbe7a5616b6d4702257e339505e6761779'
            'ab219244090109bd4c111ee2f8d574337bc668860f9e9678190f4591df4dec1a'
            '9950b2ef9948d119f67c09e78478be5c96db2028bebf735ee60a9e3c5afe0bc0'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}