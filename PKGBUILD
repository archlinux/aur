# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quaternion-appimage
pkgver=0.0.95.1
pkgrel=2
pkgdesc="A Qt5-based IM client for Matrix"
arch=('x86_64')
url="https://matrix.org/docs/projects/client/quaternion.html"
_githuburl="https://github.com/quotient-im/Quaternion"
license=('BSD3-Clause' 'GPL3' 'LGPL2.1')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE-BSD3-Clause.txt::https://raw.githubusercontent.com/quotient-im/Quaternion/dev/LICENSES/BSD-3-Clause.txt"
    "LICENSE-GPL3.txt::https://raw.githubusercontent.com/quotient-im/Quaternion/dev/LICENSES/GPL-3.0-or-later.txt"
    "LICENSE-LGPL2.1.txt::https://raw.githubusercontent.com/quotient-im/Quaternion/dev/LICENSES/LGPL-2.1-only.txt"
    "LICENSE-LGPL2.1-or-later.txt::https://raw.githubusercontent.com/quotient-im/Quaternion/dev/LICENSES/LGPL-2.1-or-later.txt")
sha256sums=('43936b9bf37539051e438ef28b111261410ab5ae59d2a2fb84f130a76ef6336b'
            'e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1'
            'c7120bba88c79b87ca40eacc1cf4ac95bcb2e96b8a00dd91886ef81dbad87f33'
            '6aee5c3d7c55f3d8ff45b1245b8427efaf0a59e9c52d7139c79bff7056e9a611'
            '6aee5c3d7c55f3d8ff45b1245b8427efaf0a59e9c52d7139c79bff7056e9a611')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/com.github.${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 scalable;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}."* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/com.github.${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}