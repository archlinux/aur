# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aes-vodka-bin
_pkgname=AES.Vodka
pkgver=0.5
_electronversion=35
pkgrel=1
pkgdesc="Encrypts and decrypts the contents of a selected folder using AES-256-GCM encryption. Provides a simple and easy-to-use interface for secure file management, built with Node.js and Electron.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/vdkvdev/AES-Vodka"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}.v${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('496d33b92e267ad407a5510e48ac06599641c832a0f807cec27c3650ada5ddb7'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/2x2/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}