# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=selenium-ide-appimage
_appname="@seleniumhq${pkgname%-appimage}"
pkgver=4.0.0_alpha.53
pkgrel=1
pkgdesc="Open Source record and playback test automation for the web."
arch=('x86_64')
url="https://selenium.dev/selenium-ide/"
_githuburl="https://github.com/SeleniumHQ/selenium-ide"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
makedepends=('squashfuse')
options=('!strip')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/${pkgver//_/-}/Selenium.IDE-${pkgver//_/-}.AppImage")
sha256sums=('c6d57c352a6b35fad2f3ed300d0fa93785921ab6be7b17fcdf552825e7c361ed')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|${_appname}|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}