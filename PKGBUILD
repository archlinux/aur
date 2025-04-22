# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=frpc-desktop-bin
_pkgname=Frpc-Desktop
pkgver=1.2.2
_electronversion=29
pkgrel=1
pkgdesc="frp cross-platform desktop client, visual configuration, easily achieve internal network penetration! Supports all frp versions.(Prebuilt version.Use system-wide electron)frp跨平台桌面客户端,可视化配置,轻松实现内网穿透!支持所有frp版本."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/luckjiawei/frpc-desktop"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'frpc'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/luckjiawei/frpc-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('11e11a6ea4db42a2465df8f3a30f90fcf0835facb26823c4d2ce0c12a00acf8c'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('53d1ea5ba114e63ac09f5c9a72a4c05677afe7036b21122e77cd9f72f6bc6479')
sha256sums_x86_64=('831edee4e04528fed0b74258656ec4a734b250888756aaa6337ea6dcee1f5dba')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}