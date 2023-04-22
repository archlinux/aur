# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mediachips-appimage"
pkgver=0.11.3beta
pkgrel=3
pkgdesc="Manage your videos, add any metadata to them and play them."
arch=("x86_64")
url="https://mediachips.app/"
_githuburl="https://github.com/fupdec/mediaChips"
license=(GPL3)
depends=(hicolor-icon-theme zlib glibc)
options=(!strip)
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%beta}-beta/MediaChips.v${pkgver%beta}.Linux.AppImage")
sha256sums=('8af9d3e09bc812826e8c67908b2bfb7b6c638d70946cf45ae696f26b2e276610')
     
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mediachips.AppImage|g;s|Utility|Utility;AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}