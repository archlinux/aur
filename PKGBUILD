# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godot-launcher-bin
_pkgname='Godot Launcher'
pkgver=1.3.0
_electronversion=34
pkgrel=1
pkgdesc="A companion app for Godot Engine development that lets you quickly manage and launch projects while maintaining per-project editor settings.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://godotlauncher.org/"
_ghurl="https://github.com/godotlauncher/launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'fuse2'
)
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/godotlauncher/launcher/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux.arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-${pkgver}-linux.x86_64.AppImage")
sha256sums=('982e513d86e81b53d35a4c757a54ce36c7b77752feeaac2dfaab3ddd0c86d7b1'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('4112ec79b23777a9b9769ffff944e6d089a23760fdd18c4c5ce4b1294718d239')
sha256sums_x86_64=('6614137ce001c5068742d4d860eed6699546759e5a4bcc5dbf7d5aaa2ac1a801')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{dist-electron,src} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}