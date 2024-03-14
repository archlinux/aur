# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ezytdl-bin
pkgver=2.4.2
_electronversion=25
pkgrel=5
pkgdesc="An application that leverages yt-dlp and FFmpeg to provide a simple, easy-to-use interface for downloading videos from YouTube, Twitch, SoundCloud, and various other sites. "
arch=('x86_64')
url="https://github.com/sylviiu/ezytdl"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
    'ffmpeg'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('1b26c8c467aa8f3025b69aecab6739be495244b9551fd59ad99007a613a13efe'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app"
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}