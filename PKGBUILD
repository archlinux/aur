# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kiwix-js-electron-bin
_pkgname=Kiwix-JS-Electron
pkgver=3.6.8
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
sha256sums=('f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
sha256sums_aarch64=('aab9f448a04d4f871b23d73387c0d088129e6149de62f103071ec6e123e29359')
sha256sums_i686=('f665799fcadd5cff06a9675d74998c35fdd2d82eb094d16531ea3c7bdef618d0')
sha256sums_x86_64=('f603f52e3ac657740107163f56e66f6edc9decf9ef0abdab24f88e8c56ca2217')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
