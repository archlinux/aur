# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="onlyoffice-appimage"
pkgver=7.3.3
pkgrel=1
pkgdesc="An office suite that combines text, spreadsheet and presentation editors."
arch=('x86_64')
url="https://www.onlyoffice.com/"
license=('AGPL3')
options=(!strip)
provides=('onlyoffice')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://github.com/ONLYOFFICE/DesktopEditors/releases/download/v7.3.3/DesktopEditors-x86_64.AppImage")
sha256sums=('f3636b51e53b1917266405e110d0635b0a8aa37341e159d7b61de48f8da807e8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|desktopeditors %F|/opt/appimages/onlyoffice.AppImage %F|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}-desktopeditors.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 24x24 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/asc-de.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-desktopeditors.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
