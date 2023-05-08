# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ganache-appimage
_appname=Ganache
pkgver=2.7.1
pkgrel=1
pkgdesc="Personal blockchain for Ethereum development"
arch=('x86_64')
url="https://www.trufflesuite.com/ganache"
_githuburl="https://github.com/trufflesuite/ganache-ui"
license=('MIT')
options=(!strip)
conflits=("${pkgname%-appimage}" "${pkgname%-appimage}-cli")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/trufflesuite/ganache-ui/develop/LICENSE")
sha256sums=('94f2471986023675690ad205fb6212b1e42078cc43978c49a437137250585c00'
            '377bc2ed45352931f327c2b1fdee39161b1e80496dccde77322d858fcc025b48')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/ganache.AppImage|g;s|Icon=Ganache|Icon=ganache|g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}