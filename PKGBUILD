# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zettlr-appimage
_appname=Zettlr
pkgver=3.0.0beta3
_pkgver=beta.3
pkgrel=1
pkgdesc="A Markdown Editor for the 21st century."
arch=('x86_64')
url="https://www.zettlr.com"
_githuburl="https://github.com/Zettlr/Zettlr"
license=(GPL3)
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%beta3}-${_pkgver}/Zettlr-${pkgver%beta3}-${_pkgver}-x86_64.AppImage")
sha256sums=('c4e0b4a86fad674d75c81662c99591f7a28ac8d391b1d00d8ee02201253ecfb8')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=AppRun|Exec=/opt/appimages/zettlr.AppImage|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}  
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${_appname}.xml" "${pkgdir}/usr/share/mime/${pkgname%-appimage}.xml"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}