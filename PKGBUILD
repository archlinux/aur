# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="subtitler-appimage"
pkgver=1.5.5
pkgrel=3
pkgdesc="Quickly download subtitles"
arch=("x86_64")
url="https://s8sachin.github.io/subtitler/"
_githuburl="https://github.com/s8sachin/subtitler"
license=('MIT')
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Subtitler-${pkgver}.AppImage"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('031b8a772c86dfe024c768149b1dfaf42cbc88f415d1864563b6a41bee67f5d6'
            '910e8030c09f74d9e027c4cd75ad09484e4897c4a92c7114651a188cbaf3a80d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/subtitler.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
           -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}