# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=compasscad-bin
_pkgname=CompassCAD
pkgver=1.5.0
_electronversion=32
pkgrel=1
pkgdesc="very good CAD software. plan out buildings, and show it off to your boss."
arch=("x86_64")
url="https://github.com/zeankundev/CompassCAD"
license=("LicenseRef-UFOL-2.0")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/zeankundev/CompassCAD/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9429e7c7798e57793bfd9d0ecbbd108fd52e9dcab0ac3bed4a8d0cf9c4597bf5'
            '2d59799d08c811b91b35bc6d0615c7b8b3e27f3e2dc676daa9abc1de4bc97c40'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-bin}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${pkgname%-bin}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s/\/build\/icons/.\/assets\/logos/;/electron-reloader/d" "${srcdir}/app.asar.unpacked/entry.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}