# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="pomota-appimage"
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple user-friendly cross-platform tauri based pomodoro timer app that forces you to take a break"
arch=('x86_64')
url="https://github.com/p32929/pomota"
license=("MIT")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/app-v${pkgver}/${pkgname%-appimage}_${pkgver}_amd64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/p32929/pomota/master/LICENSE")
sha256sums=('f77fec1d93854da07606a64125f8b9c52b2b74dfdc395ecb7f747379e5eb75d0'
            'e3c1038536eb14a593ec4d00bceccbaa4f531674adc2dd53c4be34851b0eb8b7')
    
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=pomota|Exec=${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g;s|Development|Development;Utility|g" \
        -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
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