# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jammer-appimage
_pkgname="Jammer"
pkgver=2.1.2.3
pkgrel=1
pkgdesc="Play songs in cli with youtube and soundcloud support."
arch=('x86_64')
url="https://github.com/jooapa/jammer"
license=('LicenseRef-custom')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jooapa/jammer/${pkgver}/LICENSE"
)
sha256sums=('4292316c81bfec5827687313b8eca9262c21af961cd6bbcdbff376a207b54eb6'
            '4d5d7e1b9673212e762b79a2f85a5ac9c7f454bdbcfb56f6c0e4f407039e1d94')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-appimage} -no-sandbox %U|g;s|Categories=Music|Categories=AudioVideo;|g;s|${_pkgname}-icon|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}