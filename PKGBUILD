# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname="youtube music for desktop"
pkgname="${_appname// /-}-bin"
_pkgname=YouTube-Music-for-Desktop
pkgver=0.10.11
pkgrel=1
pkgdesc="Unofficial Youtube Music Desktop App, with LastFM support."
arch=('x86_64')
url="https://youtube-music.app/"
_ghurl="https://github.com/Venipa/ytmdesktop2"
license=('custom:CC0-1.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron20'
)
makedepends=('squashfuse')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Venipa/ytmdesktop2/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f4fc00d90653779e763534d3a5007ba119f246f9c96a21636db2f31cf08c96dd'
            '33c4de6d76721945c9346b3b1024fe56f2fbb6bebbb0e761656232520a6defa6'
            'a712f8e074e822bd7785841254d87c203bd60a900ae63264a11b9b81e724669b')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    sed -e "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" \
        -e "s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -e "s|Categories=Music|Categories=AudioVideo|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}