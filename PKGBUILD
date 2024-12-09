# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mpc-qt-bin
pkgver=24.12
pkgrel=1
pkgdesc="A clone of Media Player Classic reimplemented in Qt.(Prebuilt version)"
arch=('x86_64')
url="https://mpc-qt.github.io/"
_ghurl="https://github.com/mpc-qt/mpc-qt"
license=('GPL-2.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'mpv'
    'qt6-svg'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('34d8d6965bec355c9d8da2a4685ed5403cef4aafae7d959592f2f501d238068e'
            '726bd004a183f9f413c0e00e51ecce455a8644447dc1a2eebfec0656597eaec8')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}