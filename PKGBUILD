# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-auto-bin
_pkgname='Clash Auto'
pkgver=2.5.7
_electronversion=24
pkgrel=2
pkgdesc="Use clash.meta & speedtest & easy to use.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://clashr-auto.gitbook.io/"
_ghurl="https://github.com/ClashrAuto/Clashr-Auto-Desktop"
license=('LicenseRef-unknown')
providers=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'icoutils'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-amd64-${pkgver}.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('8939ffd4f0633acfcfc7c2d8adcdeefbb66d4b22ffe1bd2409caf14bf42425b3'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_pkgname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.png"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.png"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.png"
    sed -i "s/.ico\"/.png\"/g" "${srcdir}/app.asar.unpacked/dist/electron/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{command,config,language,version} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}