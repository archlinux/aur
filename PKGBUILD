# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mpc-qt-bin
pkgver=23.12
pkgrel=1
pkgdesc="A clone of Media Player Classic reimplemented in Qt."
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
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver//./}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('d4f19ef8ece49e5d7ab3a89f6aa0dea5aa7b209e9c0d975e062926c7a35b3f77'
            '788f604679c21265524a4c5f388bee840ef8047e2f43e7e5c4b47416ea39f0f7')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}