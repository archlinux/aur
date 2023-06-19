# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
# Maintainer: zaps166 <spaz16 at wp dot pl>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="qmplay2-appimage"
_appname=QMPlay2
pkgver=23.06.17
pkgrel=1
pkgdesc="A video and audio player which can play most formats and codecs"
arch=('x86_64')
url="https://github.com/zaps166/QMPlay2"
license=("LGPL")
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_appname}-${pkgver}-1-${CARCH}.AppImage")
sha256sums=('7fe9f7ba5e4a93a98d07aa55977ea0fcba23f71fc2ae2c1e52306cff2f97541f')
     
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${_appname}|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s/Icon=${_appname}/Icon=${pkgname%-appimage}/g" \
      -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 22x22 32x32 48x48 64x64 128x128 256x256;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}