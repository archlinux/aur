# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koishi
pkgname="${_pkgname}-desktop-bin"
_appname="chat.${_pkgname}.desktop"
_shortname=koi
pkgver=1.0.1
pkgrel=1
pkgdesc="Launch Koishi from your desktop"
arch=('x86_64')
url="https://koishi.chat/manual/starter/"
_ghurl="https://github.com/koishijs/koishi-desktop"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nodejs'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-v${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('2fc27b94307ca8dc7900a7d16d19616126e541eaee59bcda2fb2b1eca083f437'
            'c2dc027ca05ca1289c1a6f30c126b4dddc105ee2d95df2f5db5e05e33ad24e14')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_shortname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_shortname}|${_pkgname}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}