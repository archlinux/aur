# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ctool-appimage
pkgver=2.2.0
pkgrel=1
pkgdesc="Common Tools for Program Development.程序开发常用工具.chrome/edge/firefox/utools/windows/inux/mac"
arch=('x86_64')
url="https://ctool.dev/"
_githuburl="https://github.com/baiy/Ctool"
license=('MIT')
options=(!strip)
conflicts=(ctool)
depends=('hicolor-icon-theme' 'zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}_tauri_linux.AppImage"
    "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('3c65f12ae30951852d95861aa4d6b0a123cf2d2405b6ea09e992e1583ce8d258'
            '459af2e36090998e7807b1d2a5b8d6a381bf94b69cbd2ec68e7943a09e2ce1e2')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract
    sed 's|Exec=ctool|Exec=/opt/appimages/ctool.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}