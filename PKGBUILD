# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moonplayer-appimage
_pkgname=MoonPlayer
_appname="com.github.coslyk.${_pkgname}"
pkgver=4.3
pkgrel=2
pkgdesc="All-in-One video player that can play videos from Youtube, Bilibili etc. as well as local videos."
arch=("x86_64")
url="https://coslyk.github.io/moonplayer.html"
_ghurl="https://github.com/coslyk/moonplayer"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}--${CARCH}.AppImage")
sha256sums=('84ce29a94c194a084fb51f7c046042b35cf920412be0e7d7450f168220c51b76')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s| %U| --no-sandbox %U|g;s|Icon=${_appname}|Icon=${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 24x24 32x32 64x64 128x128;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
}