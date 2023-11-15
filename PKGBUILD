# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdoku-appimage
pkgver=2.13.1
pkgrel=1
pkgdesc="Manga reader and library manager for the desktop"
arch=('x86_64')
url="https://houdoku.org/"
_ghurl="https://github.com/xgi/houdoku"
license=("MIT")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/Houdoku-${pkgver}.AppImage"
    "LICENSE.txt::https://raw.githubusercontent.com/xgi/houdoku/v${pkgver}/LICENSE.txt"
)
sha256sums=('1eeb55755b6d8b14f812d47e78639065c20fc5fc592fd6aaa387693ba349e978'
            'aaa8944d0b38e6aed006c07f2c43e16332f5700f93dc7a00a3490a6d27450a18')
build() {
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