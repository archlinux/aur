# Maintainer: LeSnake04 <dev.lesnake@posteo.de>
pkgname=vieb-appimage
pkgver=10.0.0
pkgrel=1
pkgdesc="Vim Inspired Electron Browser - Vim bindings for the web by design"
arch=("aarch64" "x86_64")
url="https://vieb.dev/"
_githuburl="https://github.com/Jelmerro/Vieb"
license=("GPL3")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/${pkgver}/Vieb-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/${pkgver}/Vieb-${pkgver}.AppImage")
sha256sums_aarch64=('56a1106a56aefc067359e97401a0e2a0ccd3ca9c832064ae5bd2f026bb83a9be')
sha256sums_x86_64=('530435e472e7fbd9af4645818c9ae7316c04624fe9d86c2ca803ef5e2524a7fd')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}