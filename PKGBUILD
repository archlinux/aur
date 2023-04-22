# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tockler-appimage"
pkgver=3.21.12
pkgrel=3
pkgdesc="An application that tracks your time by monitoring your active window title and idle time."
arch=('x86_64')
url="https://tockler.io/"
_githuburl="https://github.com/MayGo/tockler"
license=('GPL2')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Tockler-${pkgver}.AppImage")
sha256sums=('78770582191e5d96ac4ac20f6629ce2c8bc6a23aab5cff554e301ce2a7dc9eca')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/tockler.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}