# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=giada-bin
_pkgname=Giada
pkgver=0.26.1
pkgrel=2
pkgdesc="An open source, minimalistic and hardcore music production tool. Designed for DJs, live performers and electronic musicians."
arch=('x86_64')
url="https://www.giadamusic.com"
_ghurl="https://github.com/monocasual/giada"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'pipewire-jack'
    'libx11'
    'freetype2'
    'fontconfig'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/data/${_pkgname}-${pkgver}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('8a44f53bb8da0604f857bbb178043a4e6a62ce52bea7018dccbb4abe6a53ef76'
            '6023b57d0e81fa219ed96f4b8a6fccb401886ff00ab341a0976959ea4ca2fb8a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}