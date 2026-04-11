# Maintainer: archblux  <archblux@126.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgbase="zyplayer-appimage"
pkgname="zyfun-appimage"
pkgver=3.4.4
pkgrel=1
pkgdesc="跨平台桌面端视频资源播放器,免费高颜值"
arch=(aarch64
    x86_64)
url="https://github.com/Hiram-Wong/ZyPlayer"
license=("MIT")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=(${pkgname%-appimage})
conflicts=(${pkgname%-appimage})
replaces=(zyplayer)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-${pkgver}-x86_64.AppImage")
sha256sums_aarch64=('14c58b586fc39b9019d73df672b39a0c01956242a2754dd8b86a0d666914764d')
sha256sums_x86_64=('58ddc723d49f722021e9a957874adf4bf202eba958fa18d761dd1d61c1689c12')
_appimage="${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"

prepare() {
    chmod a+x "${_appimage}"
    "./${_appimage}" --appimage-extract >/dev/null
    sed 's|AppRun|/opt/appimages/zyfun.AppImage|g;s|Utility|AudioVideo;Utility|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}
