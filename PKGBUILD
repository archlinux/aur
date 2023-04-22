# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-redis-ui-appimage"
pkgver=2023.4.102
pkgrel=1
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=('x86_64')
url="https://www.corifeus.com/redis-ui"
_githuburl="https://github.com/patrikx3/redis-ui"
license=("MIT")
options=(!strip)
conflicts=("${pkgname%-appimage}")
providers=(patrikx3)
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/P3X-Redis-UI-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('976712322b899c80d05b61c50e52ab75fd772253cddd72f8c7b1c76678ef9126'
            '1603d2311d0db46bd4cf9ff5654093339a9864ef3fb2869b7eeb456189aeb60f')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/p3x-redis-ui.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
