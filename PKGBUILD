# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="oh-mymd-appimage"
_appname=ohmymd
pkgver=0.6.0
pkgrel=1
pkgdesc="A markdown editor,support cloud sync"
arch=('x86_64')
url="https://www.ohmymd.app/"
_githuburl="https://github.com/1oopstudio/support.ohmymd.app"
license=(unknown)
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages" 
source=("${pkgname%-appimage}-${pkgver}.AppImage::https://oss.ohmymd.milchstrabe.com/patch/linux/appimages/Oh%20Mymd-${pkgver}.AppImage")
sha256sums=('90c88c6e97743711ae5a08002575095631b4b65ffc276ae5110be5725cae0efa')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}