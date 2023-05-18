# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mdview-appimage"
pkgver=2.6.2
pkgrel=1
pkgdesc="Standalone Markdown viewer "
arch=('x86_64')
url="https://etherealengine.org/"
_githuburl="https://github.com/c3er/mdview"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-${arch}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/c3er/mdview/master/LICENSE")
sha256sums=('385f423089e7da839c7772334b3ea0f5390d07f6c234c82d34edbda33285de6f'
            '4014420ba4b48c5f19ac8645ebeec93b9a0ccd41359700efc8b4d83738d16eeb')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/mdview.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}