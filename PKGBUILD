# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="streamdock-appimage"
pkgver=2.0.0
pkgrel=3
pkgdesc="Streaming service viewer."
arch=('x86_64')
url="https://github.com/jtvberg/StreamDock"
license=("MIT")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
provides=(icidasset)
conflicts=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/StreamDock-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/jtvberg/StreamDock/main/LICENSE")
sha256sums=('cc032d75fe5340a443493380510d09c64d9b8e4cb2d970ac3be0fc77d0a9bf6b'
            'b6e6ffdf656d1070c5cbaa10491eb4ae4977c8312c7da38d2ed5f118006ce776')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=diffuse|Exec=/opt/appimages/streamdock.AppImage|g;s|Video|AudioVideo|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
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