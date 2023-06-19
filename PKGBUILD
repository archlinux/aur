# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="responsivelyapp-appimage"
pkgver=1.4.0
pkgrel=1
pkgdesc="A modified web browser that helps in responsive web development. A web developer's must have dev-tool."
arch=('x86_64')
url="https://responsivelyapp.app/"
_githuburl="https://github.com/responsively-org/responsively-app"
_downurl="https://github.com/responsively-org/responsively-app-releases"
license=('AGPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_downurl}/releases/download/v${pkgver}/ResponsivelyApp-${pkgver}.AppImage")
sha256sums=('0224c0efb54d9142c7b052f8849c1d5bbde0ec4a59343eaf2e66bb8a215d5643')
     
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${pkgname%-appimage}-desktop-app|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}