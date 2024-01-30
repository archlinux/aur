# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nheko-appimage
pkgver=0.11.3
pkgrel=6
pkgdesc="Desktop client for Matrix using Qt and C++20."
arch=("x86_64")
url="https://nheko-reborn.github.io/"
_ghurl="https://github.com/Nheko-Reborn/nheko"
license=("GPL-3.0-only")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-v${pkgver}-${CARCH}.AppImage")
sha256sums=('f2677735a256771a80a66a34fe5f3e5caad3758161de6c31cf3283e0190eddee')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${pkgname%-appimage} %u|${pkgname%-appimage} --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 scalable;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}