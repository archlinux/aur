# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-shimmer-desktop-appimage
pkgver=2.1.12
pkgrel=1
pkgdesc="Try out new features introduced with Shimmer, such as minting native tokens, setting transaction expiry times, and sending microtransactions."
arch=('x86_64')
url="https://firefly.iota.org/"
_ghurl="https://github.com/iotaledger/firefly"
license=('Apache-2.0')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}" "shimmer-firefly-wallet")
depends=(
    'glibc'
    'zlib'
)
makedepends=(
    'squashfuse'
)
options=(
    '!strip'
)
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/desktop-shimmer-${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
)
sha256sums=('9bd4ff31ae111d2bf3e33f4990f59a323258bfe8d667ccc122f552aa882490d6')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|=desktop|=${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/desktop.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}