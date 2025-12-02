# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serialportassistant-bin
_pkgname=SerialPortAssistant
_appname="io.github.KangLin.${_pkgname}"
pkgver=0.5.32
pkgrel=1
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
sha256sums_aarch64=('5018b11f5c1335c941e0f55470391792214ba08b672b0116bc0881e3d9323e42')
sha256sums_x86_64=('4578c156b153a3aa5df534713c609d505dba193fbbc256a864bcdfbadedea704')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}-${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Path=\/opt\/${_pkgname}\/bin/Path=\/usr\/lib\/${pkgname%-bin}\/bin/g
    " "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/opt/${_pkgname}/share/metainfo/${_appname}.metainfo.xml"
    mv "${srcdir}/opt/${_pkgname}/lib/x86_64-linux-gnu/"* "${srcdir}/opt/${_pkgname}/lib"
    rm -rf "${srcdir}/opt/${_pkgname}/lib/x86_64-linux-gnu"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"{bin,etc,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/libcmark.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libcmark.so.0.30.2"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/doc/${_pkgname}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/share/icons/hicolor/128x128/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/share/icons/"rabbit-* "${pkgdir}/usr/share/icons"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/share/"{style,translations} "${pkgdir}/usr/share"
}
