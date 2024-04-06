# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=koishi
pkgname="${_pkgname}-desktop-bin"
_appname="chat.${_pkgname}.desktop"
_shortname=koi
pkgver=1.1.0
pkgrel=1
pkgdesc="Launch Koishi from your desktop"
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
sha256sums=('1299788d391b7afde9fb327bd82679b509f34c20d6b1decafb2e68eb612a5764'
            '9d064bc18c8bcf7e3218df028fc3debb4eff93ea40c1570cc6251727b29cf5bf')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_shortname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|${_shortname}|${_pkgname}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    sed "s|${_appname}.desktop|${pkgname%-bin}.desktop|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/chat.${_pkgname}.appdata.xml.appdata.xml"
    sed "s|${_appname}.desktop|${pkgname%-bin}.desktop|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.appdata.xml"
    sed "s|${_appname}.desktop|${pkgname%-bin}.desktop|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/"*.xml -t "${pkgdir}/usr/share/metainfo"
}