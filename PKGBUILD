# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=ten-hands-bin
_pkgname="Ten Hands"
pkgver=2.10.3
_electronversion=11
pkgrel=12
pkgdesc="Simplest way to organize and run tasks.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url='https://tenhands.app'
_ghurl="https://github.com/saisandeepvaddi/ten-hands"
depends=(
    "electron${_electronversion}"
)
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-app_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/saisandeepvaddi/ten-hands/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5a1a4d3970a46d1fde2ccb506653f637a8b0edac5a77a64d12a45e723b555daa'
            '4844817e0496e77b4ff7dbf8084f475a9dbcb4ffe533b06960feac9fbe7cef2b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}-app/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_pkgname}\/${pkgname%-bin}-app\"/${pkgname%-bin}/g
        s/=${pkgname%-bin}-app/=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/32x32/apps/${pkgname%-bin}-app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}