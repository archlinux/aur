# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=refi-app-bin
_pkgname="Refi App"
pkgver=0.0.19
_electronversion=19
pkgrel=11
pkgdesc="A tool to make interacting with Firestore less painful.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://refiapp.io/"
_ghurl="https://github.com/thanhlmm/refi-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/thanhlmm/refi-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('01918b95b8109d2c02b0a2b517a5f59f8f795b02a02557cfd420f80fbd345dc4'
            'b2eb77a849db152dcb5ed71c597000a5dc3638559aefae0b5aa3454e8d7abe71'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname// /}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin} %U/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -i "s/icon.icns/icon.png/g" "${srcdir}/opt/${_pkgname}/resources/app/server/index.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}