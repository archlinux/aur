# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gptm-bin
_pkgname=GPTM
pkgver=1.2
_electronversion=31
pkgrel=2
pkgdesc="🤖A modern AI chat client based on Electron + Vue3 + TypeScript.(Prebuilt version.Use system-wide electron)一个基于 Electron + Vue3 + TypeScript 开发的现代化 AI 聊天客户端"
arch=('any')
url="https://github.com/Technicalflight/Gptm"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/linux-artifacts.zip"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Technicalflight/Gptm/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('5fc93e5f0b0347dd6b2dfc1ce38f300c4beda0db8395aa3d967bdf2829085cee'
            '863d4e44c64f7ef837deba40335041d2fca168ae4c939d81484fb4955183494b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${_pkgname}"*.AppImage --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Utility/Network/g
    " "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"*.so* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}