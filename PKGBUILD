# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shinden-client-bin
pkgver=3.1.2
_electronversion=29
pkgrel=2
pkgdesc="Unofficial client for the polish anime websites. It allows you to watch anime without being exposed to ads and pop-ups.(Prebuilt version.Use system-wide electron)"
arch=("x86_64")
url="https://github.com/KlapChat-Entertainment/shinden-client"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-electron-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('b8daf5f4efa78ad17223fae44eea82b2502a09b2bd483ec390fff09e0a56fe68'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}-electron/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/${pkgname%-bin}-electron %U/${pkgname%-bin} %U/g
        s/Icon=${pkgname%-bin}-electron/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}-electron/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-electron.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}-electron.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}-electron/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}