# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=serial-studio-bin
_pkgname=SerialStudio
pkgver=1.1.7
pkgrel=3
pkgdesc="Multi-purpose serial data visualization & processing program"
arch=('x86_64')
url="https://serial-studio.github.io/"
_ghurl="https://github.com/Serial-Studio/Serial-Studio"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'libp11-kit'
    'gmp'
    'libglvnd'
    'qt6-declarative'
    'libgpg-error'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.AppImage"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/Serial-Studio/Serial-Studio/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('22b6a9465b9b56bb321956991f6746117f7f084d56082b28000bed0908919be8'
            '2bd1d916e395ee261da269285a9cb803e6f594b0cb97b50e01b43e0911004d17'
            '9b0fc0eb27805a22012ca316cc9d2b04168067b89802a2818ff5f5fd241159e4')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin} %U|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}