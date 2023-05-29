# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electron-utils-appimage"
pkgver=3.3.0
pkgrel=1
pkgdesc="Electron Utils for every day usage as a dev."
arch=('x86_64')
url='https://github.com/SamTV12345/DevRustPilot'
license=('unknown')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
options=(!strip)
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}_0.0.0_amd64.AppImage")
sha256sums=('914fa2c05725657e9494c7e278afa7d437aa1b4c0da7fae0acbdf47a3ae880f6')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=electron-utils|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 32x32 128x128 256x256@2;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}