# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="yana-appimage"
pkgver=1.0.16
pkgrel=2
pkgdesc="Powerful note-taking app with nested documents, full-text search, rich-text editor, code snippet editor and more"
arch=("x86_64")
url="https://yana.js.org/"
_githuburl="https://github.com/lukasbach/yana"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Yana-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('4ea613222707524b0c93b7620bec578da8ec77cb18a52dd98afc81edf6f38083'
            'ebb422a6231ddde433e1d601377c455aefcc96cdc27662bd3ce07d08f1110152')
      
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/yana.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}