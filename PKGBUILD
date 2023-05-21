# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="etherealengine-control-center-appimage"
pkgver=0.2.8
pkgrel=1
pkgdesc="One stop solution for all your Metaverse needs. A desktop app for managing Ethereal Engine cluster. "
arch=('x86_64')
url="https://etherealengine.org/"
_githuburl="https://github.com/EtherealEngine/etherealengine-control-center"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/Ethereal-Engine-Control-Center-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/EtherealEngine/etherealengine-control-center/master/LICENSE")
sha256sums=('fa176a27e2d11cb23dbee92686c8aa0e810453a92e37bbb54be3d95d71bfd00b'
            'd346da664afe040f323eb3aecc74d5bb2a8b6d61a7ff53ccfaf1611add61a41d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/etherealengine-control-center.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 8x8 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}