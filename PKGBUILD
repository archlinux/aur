# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zxinfo-file-browser-appimage
pkgver=1.2.3
pkgrel=3
pkgdesc="Organize and manage your emulator files for ZX Spectrum & ZX 81 - powered by the web"
arch=('x86_64')
url="https://github.com/thomasheckmann/zxinfo-file-browser"
license=('MIT')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=()
makedepends=(
    'squashfuse'
)
options=('!strip')
_install_path="/opt/appimages"
source=(
    "${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/thomasheckmann/zxinfo-file-browser/v${pkgver}/LICENSE"
)
sha256sums=('9cf183fa301aad1d1c6d6a72c4a08625a167ccb1bde1857bb5f9e276003b410e'
            '2042c6124204156b44ed7676a90f1e0bb9ddfee1f76d20f7b6f220a90398f74e')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|/usr/share/icons/hicolor/256x256/apps/${pkgname%-appimage}.png|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}