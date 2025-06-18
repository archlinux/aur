# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xterminal-bin
_pkgname=XTerminal
_aarch64_ver=2.12.9
_x86_64_ver=3.15.0
case "${CARCH}" in
    aarch64)
        pkgver="${_aarch64_ver}"
        ;;
    x86_64)
        pkgver="${_x86_64_ver}"
        ;;
esac
_electronversion=31
pkgrel=1
pkgdesc="Not only powerful SSH tools, but also local consoles, and more coming soon.(Prebuilt version.Use system-wide electron)不仅是强大的SSH工具,更提供本地控制台,以及更多即将推出的开发相关功能."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.xterminal.cn/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
    'python'
)
makedepends=(
    'asar'
)
source=(
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${_aarch64_ver}-aarch64.rpm::https://cdn-cn.xterminal.cn/downloads/${_pkgname}-${_aarch64_ver}-linux-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${_x86_64_ver}-x86_64.rpm::https://cdn-cn.xterminal.cn/downloads/${_pkgname}-${_x86_64_ver}-linux-x86_64.rpm")
sha256sums=('8d08a959e0086a206ef3454cc0fc323454c73609cd764f102d8d2d076dafa0af'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
sha256sums_aarch64=('e715f44ab759f2d1cd6bce72bdb5172cad825d4c0e48613133a351da35375e08')
sha256sums_x86_64=('ef00985dfff4ff0cd68b5579ba7c7daad1294b9f468594a55406a5dc49c21642')
_get_electron_version() {
    _electronversion="strings ${srcdir}/opt/${_pkgname}/${pkgname%-bin}  | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} \;
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    rm -rf "${srcdir}/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,tray} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}