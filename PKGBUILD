# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=music-player
pkgname="moebits-${_appname}-bin"
_pkgname="Moebits Music Player"
pkgver=0.3.1
_electronversion=28
pkgrel=2
pkgdesc="A music player with real-time pitch shifting, time stretching, and reversing effects.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://musicplayer.moe/"
_ghurl="https://github.com/Moebits/Music-Player"
license=('CC-BY-NC-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/Music-Player-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Moebits/Music-Player/v${pkgver}/license.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('12d8f71918047ff4ef4f4edb166c9305f22d42279381233b2ebded0f3a455157'
            '8946c49d9a63a62f5621f114027b2842ee914bd237590f2a5496d4b044c95af9'
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
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Music Player/${_pkgname}/g
        s/Audio/AudioVideo/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}