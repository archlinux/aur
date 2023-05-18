# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="znote-appimage"
pkgver=2.2.2
pkgrel=1
pkgdesc="A Beautiful markdown editor inspired by Jupyter."
arch=('x86_64')
url="https://znote.io"
_githuburl="https://github.com/alagrede/znote-app"
license=('custom')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage"
    "LICENSE.html::${url}/cgu.html")
sha256sums=('3b58725b6621a58bacef87526e29ad48fca64a0664d0d55e1708209677fb9bd4'
            'd2a438038502a65cda1f2586eeb5a1e677a4608ad31d22c72acbc88bf0dd160a')
     
prepare() {
    chmod a+x "znote-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/znote.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/znote-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 8x8 32x32 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}