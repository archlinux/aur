# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brs-emu-app-bin
_appname="BrightScript Emulator"
_pkgname=brsEmuApp
pkgver=0.10.31
_electronversion=20
pkgrel=3
pkgdesc="BrightScript Emulator - Runs on modern browsers and Electron applications."
arch=('x86_64')
url="https://lvcabral.com/brs/"
_ghurl="https://github.com/lvcabral/brs-emu-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/lvcabral/brs-emu-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('49fe96a56a71fc5e58c185cbcf0a39e3605ee85e836f17d058973b4826a6d568'
            '1cfcbfae347c10d88c0d825db352b187f0c5ae9b7b4a685074a1e3acb94151fc'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}