# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
_pkgver_aarch64=1.25.1
_pkgver_x86_64=1.32.5
case "${CARCH}" in
    aarch64)
        pkgver="${_pkgver_aarch64}"
        _electronversion=30
    ;;
    x86_64)
        pkgver="${_pkgver_x86_64}"
        _electronversion=31
    ;;
esac
#update:https://txc.qq.com/products/598955/change-log
pkgrel=1
pkgdesc="不仅是强大的SSH工具，更提供本地控制台，以及更多即将推出的开发相关功能，让您专注于创造卓越的代码"
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.xterminal.cn/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
makedepends=(
    'asar'
)
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${_pkgver_aarch64}-aarch64.deb::https://cdn-cn.xterminal.cn/downloads/${_pkgname}-${_pkgver_aarch64}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${_pkgver_x86_64}-x86_64.deb::https://cdn-cn.xterminal.cn/downloads/${_pkgname}-${_pkgver_x86_64}-linux-amd64.deb")
sha256sums=('8d08a959e0086a206ef3454cc0fc323454c73609cd764f102d8d2d076dafa0af'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('921222e7b58b89575da8f44f3b372732e719f909174d5410f1fad89bf8d62861')
sha256sums_x86_64=('cc2a03228a7acd504c9b4ef16892c35aada464b5f82c6f1fc5c83e49509aea5d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,tray} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}