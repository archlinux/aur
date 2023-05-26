# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mattermost-desktop-appimage"
pkgver=5.4.0rc.1
_subver=rc.1
pkgrel=1
pkgdesc="Mattermost Desktop application for Linux(AppImage Version)"
arch=('x86_64')
url="https://github.com/mattermost/desktop"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver%${_subver}}-${_subver}/${pkgname%-appimage}-${pkgver%${_subver}}-${_subver}-linux-x86_64.AppImage")
sha256sums=('4ee4470c96e8ef3392e60d26dcb6a3ca138d4dc5b92cd800efa7cbe42923b9e5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mattermost-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}