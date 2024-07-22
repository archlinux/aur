# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-auto-bin
_pkgname="Clash Auto"
pkgver=2.5.7
_electronversion=24
pkgrel=1
pkgdesc="Use clash.meta & speedtest & easy to use"
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-amd64_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('50a67cfd19b7c14e60fecafb0d363505fde8f578256f2c85888e43629010415b'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/icon_reverse.png"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_error_niH_icon.png"
    magick "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.ico" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.png"
    cp "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon-4.png" "${srcdir}/app.asar.unpacked/dist/electron/static/images/tray_normal_Z8R_icon.png"
    sed "s|.ico\"|.png\"|g" -i "${srcdir}/app.asar.unpacked/dist/electron/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"{command,config,language,version} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}