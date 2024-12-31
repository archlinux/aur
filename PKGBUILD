# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_pkgname=SerialPortAssistant
_appname="org.Rabbit.${_pkgname}"
pkgver=0.5.28
pkgrel=2
pkgdesc="A cross-platform serial port assistant.(Prebuilt version)一个跨平台的串口助手"
arch=('x86_64')
url="https://github.com/KangLin/SerialPortAssistant"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'openssl'
    'qt6-scxml'
    'qt6-serialport'
    'qt6-base'
    'cmark'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('1dc386313e51bbd95d4a25256e8d95d4ee41fcab320770fa4c4f29104e0bdf58'
            '46f66d0030a40bf6ccf01e73eb2927cdf75fe74f6c72765c259874049fa1a163')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-${pkgver}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
    mv "${srcdir}/opt/${_pkgname}/lib/x86_64-linux-gnu/"* "${srcdir}/opt/${_pkgname}/lib"
    rm -rf "${srcdir}/opt/${_pkgname}/lib/x86_64-linux-gnu"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/libcmark.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libcmark.so.0.30.2"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}