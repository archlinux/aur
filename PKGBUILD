# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=alice-ai-app-bin
_pkgname=Alice.app
_appname=electron-vue-vite
pkgver=1.0.2
_electronversion=30
pkgrel=1
pkgdesc="A smart desktop AI assistant application built with Vue.js, Vite, and Electron. Advanced memory system, function calling, MCP support and more.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/pmbstyle/Alice"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-Linux-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/pmbstyle/Alice/main/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('be8c9f872b537b8bbc24c50f1b1dde28ff24d2a3d03a33f5ec45a5c4a160557d'
            '3e9927b4fcbf5507656ca5b5f90f71efb32fb5033321c0f6b9eeb69d50f4001a'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"{app.asar,app-config.json} -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}