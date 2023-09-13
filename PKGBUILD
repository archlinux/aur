# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdoku-appimage
pkgver=2.13.0
pkgrel=3
pkgdesc="Manga reader and library manager for the desktop"
arch=('x86_64')
url="https://houdoku.org/"
_githuburl="https://github.com/xgi/houdoku"
license=("MIT")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Houdoku-${pkgver}.AppImage"
    "LICENSE.txt::${_githuburl}/raw.githubusercontent.com/xgi/houdoku/v${pkgver}/LICENSE.txt")
sha256sums=('9e5eb3c358e6627e8c93153e8285bfe6bbb1f34960b6cb08a8ab49f265e8095c'
            'a5283630540208779679d02f72dc5351ceb60c13f35ef76a6c1065629aa1f7e5')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}