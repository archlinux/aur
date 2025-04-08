# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koishi
pkgname="${_pkgname}-desktop-bin"
_appname="chat.${_pkgname}.desktop"
_shortname=koi
pkgver=1.1.3
pkgrel=2
pkgdesc="Launch Koishi from your desktop.(Prebuilt version)"
arch=('x86_64')
url="https://koishi.chat/manual/starter/"
_ghurl="https://github.com/koishijs/koishi-desktop"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nodejs'
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-v${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('1ec0313db4fe5b8c2c1f22da6920917bf154292cae95b0523e29293b4f37d4ba'
            'ea5a06e60638828a3290c51071549a991ffdbb87e686b5d47a7114615a3be7c6')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_shortname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/${_shortname}/${_pkgname}/g" "${srcdir}/squashfs-root/${_appname}.desktop"
    find "${srcdir}/squashfs-root/usr/share/metainfo" -type f -exec sed -i "s/${_appname}/${pkgname%-bin}/g" {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/bin/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/"*.xml -t "${pkgdir}/usr/share/metainfo"
}