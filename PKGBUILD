# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="fdc3-sail-appimage"
pkgver=22.12.6.1030
_appver=22.12.6-1030
pkgrel=1
pkgdesc="Open implementation of the FDC3 standard using Electron and an integrated App Directory."
arch=('x86_64')
url="https://github.com/finos/FDC3-Sail"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${_appver}/FDC3-Sail-${_appver}.AppImage")
sha256sums=('81243023ba6af8562e5244f6d48f2e4dd8f17ab77984dda7a55ad0863959ea97')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/fdc3-sail.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}