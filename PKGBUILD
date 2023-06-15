# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sofie-chef-appimage"
pkgver=0.0.6
pkgrel=1
pkgdesc="Disrupting the industry & stirring pots"
arch=('x86_64')
url="https://github.com/nrkno/sofie-chef"
license=("MIT")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/SofieChef-${pkgver}-Linux-Executable.AppImage"
    "LICENSE::https://raw.githubusercontent.com/nrkno/sofie-chef/main/LICENSE")
sha256sums=('ab4b2b2e5dc39ea4bcc19f11a1d198116e802a2cd7be4d712ee548368724ada7'
            '1885e72fa406407f4135fc914d88aa7b07a74c2a0ce891f74b0224919d6ee57d')
     
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}