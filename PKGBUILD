# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="wewechat++-appimage"
pkgver=1.2.5
pkgrel=1
pkgdesc="Make weweChat great again!!! 美丽的第三方微信PC客户端"
arch=('x86_64')
url="https://gitee.com/spark-community-works-collections/wewechat-plus-plus"
license=('MIT')
options=(!strip)
providers=()
conflits=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${pkgname%++-appimage}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('629b8c300a542f95553222e5171ec0f1641013d2483839834572f59307978f12')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/wewechat++.AppImage|g;s|Chat;|Network;|g' -i "${srcdir}/squashfs-root/${pkgname%++-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%++-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%++-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}