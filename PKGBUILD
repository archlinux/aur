# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="moosync-appimage"
pkgver=8.1.0
pkgrel=1
pkgdesc="Music player capable of playing local audio or from Youtube, Spotify and many more"
arch=("x86_64")
url="https://moosync.app/"
_githuburl="https://github.com/Moosync/Moosync"
license=('GPL3')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('98cd034ffbb3bca8220c75dab26682b927df235d36da154b34d043259d097414')
        
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/moosync.AppImage|g;s|Utility|Utility;AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for icons in 16x16 32x32 48x48 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
}