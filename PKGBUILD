# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="xm-video-player-appimage"
pkgver=0.4.13
pkgrel=1
pkgdesc="A high-quality client that supports playing multiple streaming formats such as MP4, M3U8, FLV, mpeg flash, etc.一款高颜值的支持播放mp4, m3u8,flv,mpeg-dash等多种流媒体格式的客户端"
arch=("x86_64")
url="https://tauri-update-server-chi.vercel.app/"
_githuburl="https://github.com/singcl/XmVideoPlayer"
license=('BSD3-Clause')
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}" "${pkgname%-appimage}-patterns")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/singcl/XmVideoPlayer/master/LICENSE")
sha256sums=('044a9e1933d10d0583ce6a2984047b27b7919e769b8b8a235a20f53cce806cd8'
            '37231024f052817f3bc0e2f73047cca63feb6c18bbe443e3bcbfbd2d28cfab3d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|Development|Development;AudioVideo|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}