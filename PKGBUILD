# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nheko-appimage"
pkgver=0.11.3
pkgrel=1
pkgdesc="Desktop client for Matrix using Qt and C++20."
arch=("x86_64")
url="https://nheko-reborn.github.io/"
_githuburl="https://github.com/Nheko-Reborn/nheko"
license=("GPL3")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-v${pkgver}-${CARCH}.AppImage")
sha256sums=('f2677735a256771a80a66a34fe5f3e5caad3758161de6c31cf3283e0190eddee')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=nheko|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 scalable;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}