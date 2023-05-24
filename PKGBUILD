# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="revealed-appimage"
pkgver=2.0.0alpha.14
_appver=alpha.14
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
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%${_appver}}-${_appver}/Revealed.AppImage")
sha256sums=('c23362cff5ea0bc1d6e6f0289a9a81db67e4ceae135f373230899215fa5026e7')
     
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