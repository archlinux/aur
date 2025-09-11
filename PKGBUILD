# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
# Maintainer: zaps166 <spaz16 at wp dot pl>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qmplay2-appimage
_pkgname=QMPlay2
pkgver=25.09.11
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
options=(
    '!strip'
)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-1-${CARCH}.AppImage")
sha256sums=('9602ec2a45bc70e09bcf4d9d9c9f3813d25f7142b644e3d6d884f2355e488357')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-appimage}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-appimage}/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
    sed -i -e "
        s/io.github.zaps166.${_pkgname}.desktop/${pkgname%-appimage}.desktop/g
        s/${_pkgname}.desktop/${pkgname%-appimage}.desktop/g
    " "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.appdata.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
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
