# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duskplayer-bin
_pkgname="DuskPlayer"
pkgver=7.0.0
_electronversion=7
pkgrel=4
pkgdesc="A minimalistic music player, designed for simplicity. "
arch=("x86_64")
url="https://github.com/Aveek-Saha/DuskPlayer"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Aveek-Saha/DuskPlayer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4ac36192c1dccb4b33ba9483c6bd60fbc3f588509826e846ab5baaa1b43111ad'
            '634de9f3cc2e60e2040fb2162e8722d13ee3d863d9b5a1c65c3e08a6149bee1c'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g;s|Utility|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}