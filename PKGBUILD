# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=radio-app
pkgname="live-${_pkgname}-bin"
_appname="Live radio"
pkgver=1.2.1
_electronversion=23
pkgrel=7
pkgdesc="An Electron application with React and TypeScript.Streaming norwegian live radio"
arch=('x86_64')
url="https://github.com/JesperBry/live-radio-app"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('1454aaaa2bac0e6c8167bc570884165ae68602df10c2ba2b966ef0fc560307da'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar.unpacked/resources/icon.png" \
        -t "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar.unpacked/resources"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png" 
}