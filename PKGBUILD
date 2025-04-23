# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gridplayer-appimage
_pkgname=GridPlayer
_appname="com.vzhd1701.${pkgname%-appimage}"
pkgver=0.5.3
pkgrel=3
pkgdesc="Simple VLC-based media player that can play multiple videos at the same time."
arch=('x86_64')
url="https://github.com/vzhd1701/gridplayer"
license=('GPL-3.0-or-later')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'fuse2'
)
options=('!strip')
_install_path="/usr/lib/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
)
sha256sums=('7372b6905683039f902dbff830b200f9049278dc78a020dca0e4837395da3189')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    sed -i "s/${_appname}.gpls/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/mime/packages/${_appname}.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/mimetypes/${_appname}.gpls.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-appimage}.xml"
}