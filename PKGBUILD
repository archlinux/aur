# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deltachat-desktop-appimage
pkgver=1.38.1
pkgrel=1
pkgdesc="Email-based instant messaging for Desktop."
arch=('x86_64')
url="https://github.com/deltachat/deltachat-desktop"
_downloadurl="https://download.delta.chat/desktop"
license=('GPL3')
provides=("${pkgname%-desktop-appimage}")
conflits=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_downloadurl}/v${pkgver}/DeltaChat-${pkgver}.AppImage")
_install_path="/opt/appimages"
sha256sums=('a96a3dbd20fde49365d6bad3d6323566f8e6b5c9a6dfa783c19c1a1249b4c535')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}