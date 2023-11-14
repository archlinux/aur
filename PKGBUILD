# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=guiscrcpy-appimage
pkgver=2023.1.1
pkgrel=7
pkgdesc="A full fledged GUI integration for the award winning open-source android screen mirroring system"
arch=('x86_64')
url="https://guiscrcpy.srev.in/"
_ghurl="https://github.com/srevinsaju/guiscrcpy"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'scrcpy'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-appimage}-v${pkgver}.dev.m.glibc2.35-${CARCH}.AppImage"
)
sha256sums=('f106847ad8f70af7dcdc895cf05872b659e9e9e15412982cb2eb6c4dc72a7c3f')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-appimage}|Exec=${pkgname%-appimage} --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}