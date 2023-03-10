# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=melodie-appimage
_pkgname=melodie
pkgver=2.0.0
pkgrel=2
pkgdesc="Melodie is a portable, simple-as-pie music player"
arch=('x86_64')
url="https://github.com/feugy/melodie"
license=('MIT')
conflicts=('melodie')
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages/"
source=(
  "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
)
sha512sums=('0adfe2d2dec430f748a8cd6a71ff101aa2929c6e3c4e4d34e097158018b700a70bfe4bce3fccb5dcd52cefdda9234442402c656dcc9016ee55e6c386e49a8bee')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Categories=Audio/Categories=AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
