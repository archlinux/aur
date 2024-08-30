# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moonplayer-bin
_pkgname=MoonPlayer
_appname="com.github.coslyk.${_pkgname}"
pkgver=4.3
pkgrel=5
pkgdesc="All-in-One video player that can play videos from Youtube, Bilibili etc. as well as local videos."
arch=("x86_64")
url="https://coslyk.github.io/moonplayer.html"
_ghurl="https://github.com/coslyk/moonplayer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pipewire-jack'
    'alsa-lib'
    'qt6-declarative'
    'fribidi'
    'mesa'
    'libglvnd'
    'libxcb'
    'libp11-kit'
    'gmp'
    'libx11'
    'libthai'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}--${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('84ce29a94c194a084fb51f7c046042b35cf920412be0e7d7450f168220c51b76'
            '61275155862080b604a3b46f157f6e9391e473c7d70ff3af41d2fdd41ce30aea')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Icon=${_appname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 64x64 128x128;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}