# Maintainer: archblux  <archblux@126.com>
pkgname="zyplayer-appimage"
pkgver=3.2.5
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=("x86_64")
url="https://github.com/Hiram-Wong/ZyPlayer"
license=("MIT")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/ZYPlayer-linux-${pkgver}-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Hiram-Wong/ZyPlayer/main/LICENSE")
sha256sums=('81b2a685e103af56acf03546cc62cc015bd6b6b90e42efba00f73f737465e933'
            '84378c42abc60e52c641be1d9d3b5b74e587adbfce6a1be75276524120055edd')
         
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/zyplayer.AppImage|g;s|zy-player|zyplayer|g;s|Utility|AudioVideo;Utility|g' -i "${srcdir}/squashfs-root/zyplayer.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/zyplayer.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/zyplayer.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}