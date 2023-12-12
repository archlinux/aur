# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quaternion-appimage
pkgver=0.0.95.1
pkgrel=4
pkgdesc="A Qt5-based IM client for Matrix"
arch=('x86_64')
url="https://matrix.org/docs/projects/client/quaternion.html"
_ghurl="https://github.com/quotient-im/Quaternion"
license=(
    'BSD'
    'GPL3'
    'LGPL2.1'
)
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
)
sha256sums=('43936b9bf37539051e438ef28b111261410ab5ae59d2a2fb84f130a76ef6336b')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${pkgname%-appimage} --no-sandbox %U|g" -i "${srcdir}/squashfs-root/com.github.${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 scalable;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/com.github.${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}