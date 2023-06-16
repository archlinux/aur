# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spacemesh-appimage"
pkgver=0.3.9
pkgrel=1
pkgdesc="Spacemesh App (Smesher + Wallet)"
arch=('aarch64' 'x86_64')
url="https://spacemesh.io/"
_githuburl="https://github.com/spacemeshos/smapp"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::https://storage.googleapis.com/smapp/v${pkgver}/Spacemesh-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::https://storage.googleapis.com/smapp/v${pkgver}/Spacemesh-${pkgver}.AppImage")
sha256sums_aarch64=('cef0dfe7fdf12cbb615bbbf28d5db778f940ba982167da8e22990971db964f44')
sha256sums_x86_64=('e426b6b170df11d3ed0abfd6d0a6b627f30aa555a3b1351c9fa9f82a572d4f75')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g;s|${pkgname%-appimage}_app|${pkgname%-appimage}|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}_app.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}_app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}_app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
}