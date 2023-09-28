# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-appimage
_pkgname=Knot
pkgver=1.1.15
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
depends=('zlib' 'glibc')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE")
sha256sums=('a3c95dfe1a738cc86c484309be0fa1629cf4c3ee5afb4ca2cff846482119ab07'
            'e81172c8f0c194e8fb34edd30b153e60407a094bbf2492abe4e012e6a1ad854a')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|Exec=${_pkgname}|Exec=${pkgname%-appimage} --no-sandbox %U|g" \
        -e "s|icon|${pkgname%-appimage}|g;s|Application;|Utility|g;s|Name=${_pkgname}|Name=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}