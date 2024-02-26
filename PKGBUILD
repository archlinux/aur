# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=desktop-schedule-bin
_pkgname="Desktop.Schedule"
pkgver=1.1.0
_electronversion=16
pkgrel=5
pkgdesc="A concise yet elegant desktop course schedule.简洁而不失优雅的桌面课程表"
arch=("x86_64")
url="https://github.com/TimFang4162/desktop-schedule"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64-setup-${pkgver}.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/TimFang4162/desktop-schedule/master/build/icons/256x256.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('fdfaecc9d2d63d0e9c9b29f098eea1609e0663ad7611ff2b097c25621ed0add2'
            'f121ff2d43234e56c2d88542e89f68464464ecf51ba6e0b11ff24019f6599e6f'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q --categories "Utility" --name "${_pkgname//./}桌面课程表" --exec "${pkgname}"
    asar e "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/${_pkgname//./ }-linux-x64-setup-${pkgver}/resources/"*.{json,png,txt} -t "${srcdir}/app.asar.unpacked/dist/extraResources"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}"
}