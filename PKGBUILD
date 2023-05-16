# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="cider-appimage"
pkgver=1.6.1
pkgrel=1
pkgdesc="A new cross-platform Apple Music experience based on Electron and Vue.js written from scratch with performance in mind."
arch=("any")
url="https://cider.sh/"
_githuburl="https://github.com/ciderapp/Cider"
license=("AGPL3")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
optdepends=()
provides=()
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Cider-${pkgver}.AppImage")
sha256sums=('800c768337caac4459270c8cc7bce0d1885a25bf75a91a1150c8a88c4327eb11')
         
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/cider.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
         
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}