# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gridplayer-appimage
_pkgname=GridPlayer
_appname="com.vzhd1701.${pkgname%-appimage}"
pkgver=0.5.5
pkgrel=1
pkgdesc="Simple VLC-based media player that can play multiple videos at the same time."
arch=('x86_64')
url="https://github.com/vzhd1701/gridplayer"
license=('GPL-3.0-or-later')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
options=('!strip')
_install_path="/usr/lib/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
)
sha256sums=('0d04c55bfb494de879f18a83f5b061726ae25533662b42109400f7e6463444eb')
prepare() {
    if [ ! -x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    sed -i "s/${_appname}.gpls/${pkgname%-appimage}/g" "${srcdir}/squashfs-root/usr/share/mime/packages/${_appname}.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
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
