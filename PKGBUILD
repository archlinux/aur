# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-bin
_pkgname=R3PLAYX
pkgver=2.6.0
pkgrel=1
pkgdesc="a music player forked from YesPlayMusic。高颜值的第三方网易云播放器，支持 Windows / macOS / Linux"
arch=('x86_64')
url="https://github.com/Sherlockouo/music"
license=('AGPL3')
conflicts=("${pkgname%-bin}" "yesplaymusic" "r3play")
provides=("yesplaymusic")
depends=(
    'bash'
    'electron23'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('05b65c93e3928522ee5acb6a29f17b1631b212bdf1299cab04cd2db419cf8bf0'
            '1f01d878c1ec385949b14447c2b97348c5a25618a0e9f0039f2efb3d7684cb3d')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" \
        -e "s|Icon=desktop|Icon=${pkgname%-bin}|g" \
        -e "s|Categories=Music;|Categories=AudioVideo;|g" \
        -i "${srcdir}/squashfs-root/desktop.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/squashfs-root/resources/bin/better_sqlite3.node" -t "${pkgdir}/usr/lib/${pkgname%-bin}/bin"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 24x24 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}