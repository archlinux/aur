# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

pkgname=flow-browser-bin
_pkgname=Flow
pkgver=0.8.2
_electronversion=36
pkgrel=1
pkgdesc="A modern, tabbed web browser with Chrome extension support—built on Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/MultiboxLabs/flow-browser"
license=('GPL-3.0-or-later')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9694c38a8bfa8b28456024797ec4b5f57a6170db5f6e460e588ed783cfba0616'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*

    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -i "s/Name=Flow/Name=Flow Browser/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed -i "s/Icon=flow-browser/Icon=\/usr\/share\/pixmaps\/flow-browser.png/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
