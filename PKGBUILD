# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
# Maintainer: zaps166 <spaz16 at wp dot pl>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qmplay2-appimage
_appname=QMPlay2
pkgver=24.04.02
pkgrel=1
pkgdesc="A video and audio player which can play most formats and codecs"
arch=('x86_64')
url="https://github.com/zaps166/QMPlay2"
license=("LGPL-3.0-only")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-1-${CARCH}.AppImage")
sha256sums=('283db4c396b73ce4803fd9773e678c700925382d77403ad200069a6a233077ae')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|Exec=${_appname}|Exec=${pkgname%-appimage}|g" \
        -e "s/Icon=${_appname}/Icon=${pkgname%-appimage}/g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}