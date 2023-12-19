# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyperamp-appimage
_appname=Hyperamp
pkgver=1.0.10
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
sha256sums_aarch64=('58920e7e31b29abb98c51764b76c1a7c831a095874d8e50ae399c3c7bd8b475c')
sha256sums_armv7h=('1ffca5c8564c4dbbb1def2ebbe61c5ce66a23a037f6bd9d88f0f24491288fa2a')
sha256sums_x86_64=('fdf038391d75490a9577706dfe58d3fd5f431796e07eb5526933ba141eb53674')
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