# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
# Maintainer: zaps166 <spaz16 at wp dot pl>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qmplay2-appimage
_pkgname=QMPlay2
pkgver=24.12.28
pkgrel=1
pkgdesc="A video and audio player which can play most formats and codecs"
arch=('x86_64')
url="https://github.com/zaps166/QMPlay2"
license=("LGPL-3.0-only")
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'glibc'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1-${CARCH}.AppImage")
sha256sums=('ef0ac52f9d31daa54e3632bdb8280f5c44ac14f58b1021dc65b6fc1b58e94d8f')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-appimage}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-appimage}/g
    " -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    sed -e "
        s/io.github.zaps166.${_pkgname}.desktop/${pkgname%-appimage}.desktop/g
        s/${_pkgname}.desktop/${pkgname%-appimage}.desktop/g
    " -i "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    _icon_sizes=(16x16 22x22 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/"*.xml -t "${pkgdir}/usr/share/mime/packages"
}