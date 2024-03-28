# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
pkgver=1.20.23
#update:https://txc.qq.com/products/598955/change-log
_electronversion=28
pkgrel=1
pkgdesc="不仅是强大的SSH工具，更提供本地控制台，以及更多即将推出的开发相关功能，让您专注于创造卓越的代码"
arch=("x86_64")
url="https://www.xterminal.cn/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'python>3'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://cdn-cn.xterminal.cn/xterminal/${_pkgname}-${pkgver}-linux-amd64.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d091ba2a12f5277b56e603780a58fbff139853297506ca99d9c69563978722b'
            '8d08a959e0086a206ef3454cc0fc323454c73609cd764f102d8d2d076dafa0af'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|\"tray\/icon.png|\"..\/..\/${pkgname%-bin}\/tray\/icon.png|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
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