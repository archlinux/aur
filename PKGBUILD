# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opal-player-bin
_pkgname=Opal
pkgver=1.3.1
pkgrel=1
pkgdesc="Plays relaxing music in the background"
arch=('x86_64')
url="https://codedead.com/"
_ghurl="https://github.com/CodeDead/opal"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libx11'
    'alsa-lib'
    'libxtst'
    'libxrender'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('9d7d008f94cdf13ef3e9628d2e5a671f8fc830c532c6a0af52ee5380329d2bdc'
            '19042ac56436e3b24a2662c24f6c0fdfb8feebf3506532956c53aef014583e07')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod 755 "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin} %U|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Utility|AudioVideo|g" \
        -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib} "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_pkgname}.appdata.xml" "${pkgdir}/usr/share/icons/metainfo/${pkgname%-bin}.appdata.xml"
}