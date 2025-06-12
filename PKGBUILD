# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwix-js-electron-bin
_pkgname=Kiwix-JS-Electron
pkgver=3.6.6
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
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('ab244700d484a4d7e9c6caef4c88c8ef9b868f9aa0d359fbb2f32b96645114d7')
sha256sums_i686=('87d62d10e6ae2e9d7958114ba51a74327f15a50271fc08b92d61decb5449cf84')
sha256sums_x86_64=('e31d7f17d032579947dba18a450a70074f4860d96032d714dbf59ad1012b06b8')
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
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/archives" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}