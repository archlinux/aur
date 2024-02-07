# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-iota-desktop-appimage
pkgver=2.0.6
pkgrel=1
pkgdesc="Manage your IOTA assets directly from your computer with both software and hardware wallet support. Earn staking rewards and participate in governance votes."
arch=('x86_64')
url="https://firefly.iota.org/"
_ghurl="https://github.com/iotaledger/firefly"
license=('Apache-2.0')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=(
    "${pkgname%-appimage}"
    "iota-firefly-wallet"
)
depends=(
    'glibc'
)
makedepends=(
    'squashfuse'
)
options=(
    '!strip'
)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/desktop-iota-${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('a42bb550b5bc3fcad10382d993dc66589b5b256b5ddbd618c9d3a1433d962fd2')
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