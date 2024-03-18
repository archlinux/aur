# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kubenav-appimage
pkgver=4.2.3
pkgrel=6
pkgdesc="The navigator for your Kubernetes clusters right in your pocket."
arch=('x86_64')
url="https://kubenav.io/"
_ghurl="https://github.com/kubenav/kubenav"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/kubenav/kubenav/v${pkgver}/LICENSE"
)
sha256sums=('9318290887f6c7d96294fc8cd47754c568ac3c18eb41a2c776f31cf9cdb85281'
            '8b3342858e9f80f58fd2b895d71aa21d1b7c96c6ee1923ea8cb7ee319acc44f8')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}