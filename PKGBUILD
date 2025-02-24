# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_pkgname=SerialPortAssistant
_appname="org.Rabbit.${_pkgname}"
pkgver=0.5.30
pkgrel=3
pkgdesc="A cross-platform serial port assistant.(Prebuilt version)一个跨平台的串口助手"
arch=(
    'aarch64'
    'x86_64'
)
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
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu-24.04_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_ubuntu-24.04_amd64.deb")
sha256sums=('46f66d0030a40bf6ccf01e73eb2927cdf75fe74f6c72765c259874049fa1a163')
sha256sums_aarch64=('05fe5f13f0cfbc4a28235f830950ba413b36f29d1575296e4375840441d7fd07')
sha256sums_x86_64=('2ee1dd8271cad4bdfeab1a7ac3287ebb6da394d08b6475dec15266c47bd0cb51')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-${pkgver}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Path=\/opt\/${_pkgname}\/bin/Path=\/usr\/lib\/${pkgname%-bin}\/bin/g
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
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}