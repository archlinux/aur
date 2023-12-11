# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-appimage
_pkgname=SerialStudio
pkgver=1.1.7
pkgrel=4
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://serial-studio.github.io/"
_ghurl="https://github.com/Serial-Studio/Serial-Studio"
license=('custom')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/v${pkgver}/LICENSE.md"
)
sha256sums=('22b6a9465b9b56bb321956991f6746117f7f084d56082b28000bed0908919be8'
            '2bd1d916e395ee261da269285a9cb803e6f594b0cb97b50e01b43e0911004d17')
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
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}