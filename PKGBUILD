# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="unsplash-wallpapers-appimage"
pkgver=1.3.0
pkgrel=1
pkgdesc="A cross-platform desktop application to set wallpapers from Unsplash built with Electron, React, and Redux"
arch=("x86_64")
url="https://github.com/soroushchehresa/unsplash-wallpapers"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Unsplash-Wallpapers-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/soroushchehresa/unsplash-wallpapers/master/LICENSE")
sha256sums=('979721488df4cab3685cfd6882c70a312da2310e79d61aa9356480b7364cb690'
            'e7ee68282295100c6be4565152cb535d43086d2354760a8f006f1e980e0a3bb5')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|Settings|Settings;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}   
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}