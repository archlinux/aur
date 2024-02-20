# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_pkgname=SerialPortAssistant
pkgver=0.5.19
pkgrel=1
pkgdesc="A cross-platform serial port assistant.一个跨平台的串口助手"
arch=("x86_64")
url="https://github.com/KangLin/SerialPortAssistant"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'qt6-scxml'
    'qt6-serialport'
    'qt6-webengine'
    'qt6-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('2362dcfc6666b9ed507e7acafb03385db3302ece78b1f63501756f48fcde6cf2'
            '050ebe2b50abe17e74c7f7dfb068b7c9460dbbafc62c9e87e047fb495840d3ba')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}-v${pkgver}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${_pkgname}/bin/${_pkgname}.sh|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/${_pkgname}/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}