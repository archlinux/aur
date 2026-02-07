# Maintainer: archblux  <archblux@126.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgbase="zyplayer-appimage"
pkgname="zyfun-appimage"
pkgver=3.4.1
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
sha256sums_aarch64=('e47ea485df83a2eece1289c83e8066ed38ee013e99be4dca43b8047b5219bb00')
sha256sums_x86_64=('ca1f4af1e5d078bb1101c38b8606e76b80f8730b288d588d89efde57a5a3bf87')
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
