# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="youtube-downloader-appimage"
pkgver=1.1.5
pkgrel=1
pkgdesc="A simple cross platform desktop application that downloads video/audio from youtube videos.Built with Electron, Node/Typescript, and React"
arch=('x86_64')
url="https://github.com/AnthonyGress/youtube-downloader"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc' 'yt-dlp')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Youtube-Downloader-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AnthonyGress/youtube-downloader/main/LICENSE")
sha256sums=('8bce9da8a9258bc2a41c8512241bd0c03c668890d72ba706cd39d0a280db3eed'
            '65cb0d2fdca7e4375a2ab466fb1e37fef2514eb10c88c5cf8998893a77295176')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 180x180 192x192 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}