# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sbe-appimage"
pkgver=3.4.0
pkgrel=1
pkgdesc="An unofficial Scrapbox desktop app"
arch=('x86_64')
url="https://github.com/kondoumh/sbe"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/kondoumh/sbe/master/LICENSE")
sha256sums=('0e1c0f7a8b7db2919490432b7c01d94af54f22b3470389049b24e48a0e5bc0b9'
            '0c0557908ff74a92af66c9b4435403c14e230c11e56eace0016fcfb7151187d2')
      
prepare() {
    chmod a+x "sbe-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/sbe.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/sbe-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}