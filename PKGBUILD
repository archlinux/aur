# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aechoterm-bin
_pkgname=Aechoterm
pkgver=4.0.2
_electronversion=13
pkgrel=3
pkgdesc="A free, cross-platform terminal and file management tool for accessing remote servers with SSH and SFTP protocols.(Prebuilt version.Use system-wide electron)闪令是一款免费的、跨平台的,以SSH、SFTP协议访问远程服务器的终端、文件管理工具"
arch=(
    'aarch64'
    'x86_64'
)
url="https://ec.nantian.com.cn/"
_ghurl="https://github.com/Aechoterm/Aechoterm"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
options=('!strip')
source=(
    "LICENSE.html::${url}/privacy-agreement.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://ec.cdn.nantian.com.cn/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://ec.cdn.nantian.com.cn/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('cc65895a835817a900c9c2c4006a1738a6f2284cfa29eeb8283fd0043121931e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('58f37a6d3987648ab0097a843648aae2f1bc7085ea0df010d11d08f7930d18e3')
sha256sums_x86_64=('67d16a2e5aebb6d43ef7a4000c5991d62f49950b7aa3dcc48c978a764dd5250d')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/g
        s/Development/Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/opt/${_pkgname}/resources/app/node_modules" -type d \( -name "android-*" -o -name "darwin-*" -o -name "win32-*" \) -exec rm -rf {} +
    case "${CARCH}" in
        aarch64)
            find "${srcdir}/opt/${_pkgname}/resources/app/node_modules" -type d \( -name "linux-arm" -o -name "linux-x64" \) -exec rm -rf {} +
            ;;
        x86_64)
            find "${srcdir}/opt/${_pkgname}/resources/app/node_modules" -type d -name "linux-arm*" -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}