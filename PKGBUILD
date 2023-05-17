# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tesler-appimage"
pkgver=0.2.3
pkgrel=1
pkgdesc="TesLEr - The Tesla Sentinel Viewer"
arch=('x86_64')
url="https://github.com/j-catania/TeslaSentinelViewer"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/TesLEr-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/j-catania/TeslaSentinelViewer/main/LICENSE")
sha256sums=('5447e01520ad757fdbb4130e764a863c9d282c5dd48cf2fabbd33e171a2decfd'
            '29eee3e9d9c5dd67213ec3ab4a7eef57a1224750e2e9aab3a278177a9444a355')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/tesler.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}