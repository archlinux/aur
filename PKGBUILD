# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=firefly-shimmer-desktop-appimage
pkgver=2.1.9
pkgrel=1
pkgdesc="Try out new features introduced with Shimmer, such as minting native tokens, setting transaction expiry times, and sending microtransactions."
arch=('x86_64')
url="https://firefly.iota.org/"
_githuburl="https://github.com/iotaledger/firefly"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}" "shimmer-firefly-wallet")
depends=('zlib' 'glibc')
makedepends=('squashfuse')
options=("!strip")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/desktop-shimmer-${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums=('3595af9c52ac97e3ae9a3614d60d296d08e991ad12128da6639b61ec329319cf')
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