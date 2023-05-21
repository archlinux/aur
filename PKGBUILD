# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="revealed-appimage"
pkgver=2.0.0alpha.13
_appver=2.0.0-alpha.13
pkgrel=1
pkgdesc="A platform and store for apps, games, and more!"
arch=('x86_64')
url="https://www.appsrevealed.com/"
_githuburl="https://github.com/BunnyStrike/revealed"
license=('GPL3')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${_appver}/Revealed.AppImage")
sha256sums=('d4ae320e06436a7d0857d40928962e16c6d2671e1c464f24064c2150d2ac9417')
     
prepare() {
    chmod a+x "revealed-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/revealed.AppImage|g' -i "${srcdir}/squashfs-root/@${pkgname%-appimage}desktop.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/revealed-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/@${pkgname%-appimage}desktop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/@${pkgname%-appimage}desktop.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/@${pkgname%-appimage}desktop.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}