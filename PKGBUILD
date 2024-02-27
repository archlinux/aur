# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=opal-player-bin
_pkgname=Opal
pkgver=1.3.0
pkgrel=2
pkgdesc="Plays relaxing music in the background"
arch=('x86_64')
url="https://codedead.com/"
_ghurl="https://github.com/CodeDead/opal"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'java-runtime'
    'libx11'
    'libxext'
    'libxrender'
    'libxtst'
    'alsa-lib'
    'libxi'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('4f5fb19cf085c3f160f373100c89a4ff67dc1bff5b270db852df115b658328ef'
            '62a78a27802fc0a643a84e47903b74f61abe39adbef3445fe5195c118d77dc77')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
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