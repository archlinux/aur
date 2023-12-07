# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=giada-appimage
_pkgname=Giada
pkgver=0.26.0
pkgrel=2
pkgdesc="An open source, minimalistic and hardcore music production tool. Designed for DJs, live performers and electronic musicians."
arch=('x86_64')
url="https://www.giadamusic.com"
_ghurl="https://github.com/monocasual/giada"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/data/${_pkgname}-${pkgver}-${CARCH}.AppImage"
)
sha256sums=('a846511f3f391d5fc35edeb12fec1c6e8be580c51fc3d8c93fdab4af6457f221')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${pkgname%-appimage} --no-sandbox %U|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}