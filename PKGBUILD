# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-appimage
_appname=Knot
pkgver=1.1.08
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
depends=('zlib' 'glibc')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_appname}-Linux-${CARCH}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/Knot/main/LICENSE")
sha256sums=('db9c56253f5f1548bb4b8353298633b873cd3d9556bd56085926a4a2f98fa0f9'
            'e81172c8f0c194e8fb34edd30b153e60407a094bbf2492abe4e012e6a1ad854a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    sed "s|Exec=${_appname}|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/default.desktop"
    sed "s|icon|${pkgname%-appimage}|g;s|Application;|Utility|g;s|Name=${_appname}|Name=${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/default.desktop"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}