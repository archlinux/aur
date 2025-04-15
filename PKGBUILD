# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=wiznote
pkgname="${_appname}plus-bin"
_pkgname=WizNotePlus
pkgver=2.12.0
pkgrel=2
pkgdesc="A community-driven cross-platform note-taking client.(Prebuilt version.Use system-wide electron)为知笔记 Plus 是一款基于云服务的跨平台个人知识管理工具。"
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
            '528541023d81cf714301f6b8a9cf6533c0697010b4942cc8bd5b011b54ad8c97')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/\.\/${_pkgname}\/bin\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/opt/${pkgname%-bin}"
    _icon_sizes=(8x8 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}