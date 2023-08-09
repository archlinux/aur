# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-appimage
pkgver=1.1.06
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
depends=('zlib' 'glibc')
options=(!strip)
providers=("${pkgname%-appimage}=${pkgver}")
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/Knot-Linux-${CARCH}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/Knot/main/LICENSE")
sha256sums=('7209b628edf88a9df6e01fdc84d9400d8b749d0972a0f2f38dcb4a9d6ada18c9'
            'e81172c8f0c194e8fb34edd30b153e60407a094bbf2492abe4e012e6a1ad854a')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    sed "s|Exec=Knot|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g;s|Icon=icon|Icon=${pkgname%-appimage}|g;s|Categories=Application|Categories=Utility|g;s|Name=Knot|Name=Android-Knot|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}