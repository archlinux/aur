# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=exifcleaner-appimage
pkgver=3.6.0
pkgrel=1
pkgdesc="Cross-platform desktop GUI app to clean image metadata"
arch=('x86_64')
url="https://exifcleaner.com/"
_githuburl="https://github.com/szTheory/exifcleaner"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/ExifCleaner-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/szTheory/exifcleaner/master/LICENSE")
sha256sums=('418144fff26801316edb093ebdcdee3e72a035343c06251323b86ab345ea154f'
            'a74847d1e523991859009094dca82f704240d291dea5728a59de9e419cf104ac')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/exifcleaner.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}