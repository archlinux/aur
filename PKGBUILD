# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="thinreports-section-editor-appimage"
pkgver=1.0.0.dev
app_ver=1.0.0-dev
pkgrel=1
pkgdesc="A template editor for Thinreports to edit Section Format templates"
arch=('x86_64')
url="https://github.com/thinreports/thinreports"
_githuburl="https://github.com/thinreports/thinreports-section-editor"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${app_ver}/${pkgname%-appimage}-${app_ver}-linux-20221031-0b5119.AppImage"
    "LICENSE::https://raw.githubusercontent.com/thinreports/thinreports-section-editor/main/LICENSE")
sha256sums=('818e3b1fdf4fb1ed1fdbe47cc58a034074a652577a887b168edfb033f47b6aeb'
            '2d416fa05a32860094f618f477a982dd77676b236dc710f2a4df289b7e43ae0c')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/thinreports-section-editor.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}