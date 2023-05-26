# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="koishi-desktop-appimage"
_appname=chat.koishi.desktop
pkgver=0.10.5
pkgrel=1
pkgdesc="Launch Koishi from your desktop"
arch=('x86_64')
url="https://koishi.chat/manual/starter/"
_githuburl="https://github.com/koishijs/koishi-desktop"
license=('AGPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-linux-x64-v${pkgver}.AppImage")
sha256sums=('d2b849fd34002aa5deb17ca40f801ecb9e4073aeb7ce958ee94514784ef16df1')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=koi|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.svg"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}"
    sed "s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/usr/share/metainfo/"*
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/"* -t "${pkgdir}/usr/share/metainfo"
}