# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="notable-appimage"
pkgver=1.8.4
pkgrel=4
pkgdesc="The Markdown-based note-taking app that doesn't suck."
arch=("x86_64")
url="https://notable.app/"
_githuburl="https://github.com/notable/notable"
license=('custom')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${pkgname%-appimage}")
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Notable-${pkgver}.AppImage"
    "LICENSE::${_githuburl}/raw/master/SOURCE_CODE.md")
sha256sums=('7ee59f198613f35e8cdb21b73dc100cb1798201716ed9b108e5398a8f9477f67'
            '761159ffb2c4caef19adde130bebbffcc98e57aa98cde860a05d986f95e6ed4f')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/notable.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}