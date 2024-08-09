# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=music-player
pkgname="moebits-${_appname}-bin"
_pkgname="Moebits Music Player"
pkgver=0.2.6
_electronversion=28
pkgrel=1
pkgdesc="A music player with real-time pitch shifting, time stretching, and reversing effects."
arch=('x86_64')
url="https://musicplayer.moe/"
_ghurl="https://github.com/Moebits/Music-Player"
license=('CC-by-nc-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/Music-Player-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Moebits/Music-Player/v${pkgver}/license.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('6d79ec793740c5736f8cd00a888279e795f44dd09c782c9ed25372268984fadd'
            '8946c49d9a63a62f5621f114027b2842ee914bd237590f2a5496d4b044c95af9'
            'c053a7b3ed8b0b4d77f78e81ab8a4c61cbfd773a9298b3f3a187e5df89c125c2')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g;s|Music Player|${_pkgname}|g;s|Audio|AudioVideo|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp "${srcdir}/squashfs-root/resources/app.asar.unpacked" -r "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}