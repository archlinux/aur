# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opal-appimage
_pkgname=Opal
pkgver=1.3.0
pkgrel=2
pkgdesc="Plays relaxing music in the background"
arch=('x86_64')
url="https://codedead.com/"
_ghurl="https://github.com/CodeDead/opal"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
)
sha256sums=('4f5fb19cf085c3f160f373100c89a4ff67dc1bff5b270db852df115b658328ef')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-appimage}|g;s|Icon=${_pkgname}|Icon=${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}