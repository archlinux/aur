# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moonplayer-bin
_pkgname=MoonPlayer
_appname="com.github.coslyk.${_pkgname}"
pkgver=4.3
pkgrel=6
pkgdesc="All-in-One video player that can play videos from Youtube, Bilibili etc. as well as local videos.(Prebuilt version)"
arch=('x86_64')
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
            '971219b640cf1c672337d7c38e6dff14cf3ff96c74f6288c6a899034e8f738af')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Icon=${_appname}/Icon=${pkgname%-bin}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,qml,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 24x24 32x32 64x64 128x128)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}