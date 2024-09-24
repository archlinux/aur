# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
_pkgver_aarch64=1.32.10
_pkgver_x86_64=1.32.10
_electronversion_aarch64=31
_electronversion_x86_64=31
case "${CARCH}" in
    aarch64)
        pkgver="${_pkgver_aarch64}"
        _electronversion="${_electronversion_aarch64}"
    ;;
    x86_64)
        pkgver="${_pkgver_x86_64}"
        _electronversion="${_electronversion_x86_64}"
    ;;
esac
#update:https://txc.qq.com/products/598955/change-log
pkgrel=1
pkgdesc="Not only powerful SSH tools, but also local consoles, and more coming soon.不仅是强大的SSH工具,更提供本地控制台,以及更多即将推出的开发相关功能."
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
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('4a194884d09483da0b1590f8a209402e3a3da6d4df91c9e02f9f2525d4c5a728')
sha256sums_x86_64=('4b631225243aa643e0b3aa1086632b740a7ec6eaa1cf0c3f489610ae92e76ade')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} \;
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