# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyperamp-appimage
_appname=Hyperamp
pkgver=1.1.5
_electronversion=28
pkgrel=1
pkgdesc="Humble music player"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://twitter.com/hyperampapp"
_ghurl="https://github.com/hypermodules/hyperamp"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
options=('!strip')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}.AppImage")
sha256sums_aarch64=('db2030d09356cfabd01b288e615e26744cb268e811c2598bde3b2d8dcbef5859')
sha256sums_armv7h=('40ff90e20263014310087d1a182689b8b76250d175c489f08eebcd60e389343b')
sha256sums_x86_64=('3a896047ce760ac89b8e3d9bf3dce018aecc6347df320eae63069326b11e6e36')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-appimage}|g;s|Audio|AudioVideo|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}