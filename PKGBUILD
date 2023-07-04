# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="teams-for-linux-appimage"
pkgver=1.1.11
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc' 'fuse2')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums_aarch64=('3fadb89dd4bff13eafcd3c5c7c47fc14d03496d0c28f2ec7eab050aa71edb7ce')
sha256sums_armv7h=('6a632120f9326d9c71e3f6eee14876530d556c8ad08aceb5ebadad59a45e9723')
sha256sums_x86_64=('f6e9df67a1083e71b8bcfb0d7a8c30b0db73ca394b1effd388cf67ad0fb0ebdb')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}