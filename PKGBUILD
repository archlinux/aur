# Maintainer: archblux  <archblux@126.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgbase="zyplayer-appimage"
pkgname="zyfun-appimage"
pkgver=3.4.0
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
sha256sums_aarch64=('5e12e46f61fd40225b15aeaf15cc6f5051f346700118ee57808fffca7774dbe5')
sha256sums_x86_64=('02b6fc52aee0bac3522d00380659c8e04f018999d56bc1b6f733a7d862796cd8')
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
