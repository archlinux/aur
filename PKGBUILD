# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwix-js-electron-bin
_pkgname=Kiwix-JS-Electron
pkgver=3.7.1
_electronversion=29
pkgrel=1
pkgdesc="Kiwix JS Offline Browser implemented as a Progressive Web App (PWA), and packaged as Electron, NWJS and UWP apps for Windows and Linux.(Prebuild version.Use system-wide electron)"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://pwa.kiwix.org/"
_ghurl="https://github.com/kiwix/kiwix-js-pwa"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-E-arm64.AppImage")
source_i686=("${pkgname%-bin}-${pkgver}-i686.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-E-i386.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-E.AppImage")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('47307a0b6c6274fc7c8316185c99b42d32719b7d4665075be244f45cc2bd148f')
sha256sums_i686=('c285993f778143517c91fd19f0fc609a55ac86aee8f2d114c0f3ea0acc9eae5a')
sha256sums_x86_64=('7b3f0dacdfa3d243140f31b75c17dd3a320f5f213f4c306a8881a8b10b1de276')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/squashfs-root/${_pkgname//-/ }" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//-/ }/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_pkgname//-/ }/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname//-/ }.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/archives" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname//-/ }.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname//-/ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
