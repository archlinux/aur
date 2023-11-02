# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ezytdl-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="An application that leverages yt-dlp and FFmpeg to provide a simple, easy-to-use interface for downloading videos from YouTube, Twitch, SoundCloud, and various other sites. "
arch=('x86_64')
url="https://github.com/sylviiu/ezytdl"
license=('GPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'bash'
    'electron25'
    'ffmpeg'
    'libdbusmenu-glib'3
    'libxext'
    'gdk-pixbuf2'
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('1b26c8c467aa8f3025b69aecab6739be495244b9551fd59ad99007a613a13efe'
            'ca691bc3de122143291dd35596858221e5602768e3ed760a34ac600bfb2ec314')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}