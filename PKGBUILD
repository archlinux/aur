# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ngrev-appimage"
pkgver=0.0.35
pkgrel=1
pkgdesc="Tool for reverse engineering of Angular applications"
arch=('x86_64')
url="https://github.com/mgechev/ngrev"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE.md::https://raw.githubusercontent.com/mgechev/ngrev/master/LICENSE.md")
sha256sums=('c9f1d0212edf967c97a2e29610712b4c5f14ca9e58a9c1fbb39be2bfbe3907b1'
            '00df8834a94ab4d44c7c7d6557cce6af143ed0019a80c682b5a03d0cea8187b4')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/ngrev.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}