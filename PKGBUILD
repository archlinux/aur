# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=wiznote
pkgname="${_appname}plus-bin"
_pkgname=WizNotePlus
pkgver=2.12.0
pkgrel=1
pkgdesc="A community-driven cross-platform note-taking client.为知笔记 Plus 是一款基于云服务的跨平台个人知识管理工具。"
arch=('x86_64')
url="https://altairwei.github.io/WizNotePlus/"
_ghurl="https://github.com/altairwei/WizNotePlus"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'nss'
    'qt5-base'
    'openssl-1.1'
)
makedepends=(
    'fuse2'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-v${pkgver}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('8674986c6a73de5649b3b827faabf26153c60256480fcb8e553a63d8588251cf'
            '7110b65be39390ff2b7fec842e7a71360e68bedaa89c051dd70738858e69e9fc')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|./${_pkgname}/bin/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 8x8 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}