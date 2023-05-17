# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=wire-desktop-appimage
pkgver=3.31.3060
pkgrel=1
pkgdesc="Wire for desktop"
arch=("x86_64")
url="https://wire.com/download/"
_githuburl="https://github.com/wireapp/wire-desktop"
license=("GPL3")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/linux%2F${pkgver}/Wire-${pkgver}_${arch}.AppImage")
sha256sums=('717357a1c4be410005d45191f482dc2eb090f521ad08558250799540cd47d1c6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/wire-desktop.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}