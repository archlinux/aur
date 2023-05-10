# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tropy-appimage
pkgver=1.13.1
pkgrel=1
pkgdesc="Research photo management"
arch=('x86_64')
url="https://tropy.org/"
_githuburl="https://github.com/tropy/tropy"
license=('GPL3')
depends=('zlib' 'glibc' 'hicolor-icon-theme' 'xdg-utils')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Tropy-${pkgver}-x86_64.AppImage"
  "LICENSE::https://raw.githubusercontent.com/tropy/tropy/main/LICENSE")
sha256sums=('acf081c6f44fbf5abeade136ba1fa84cc23833a590d671c76f121d7559c41fe1'
            '2406653c61846ad831e8cbb4b8908061e3f7a7a0c88f32617ea5cd92c919b1b3')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=tropy|Exec=/opt/appimages/tropy.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications/"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/mimetypes/"*.png \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime/packages/"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}