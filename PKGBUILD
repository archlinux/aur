# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-appimage
_pkgname=Knot
pkgver=1.1.20
pkgrel=1
pkgdesc="An Android gadget that integrates common modules such as Todo, Notes and Reader and supports various clients (Win, Mac, Linux) for editing Todo and Notes."
arch=("x86_64")
url="https://github.com/ic005k/Knot"
license=("MIT")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE"
)
sha256sums=('1273caee7fb24724fa53e47c89773575ae0494c35cae14b749575d7f775271a5'
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}