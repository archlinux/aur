# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hyperamp-appimage
_appname=Hyperamp
pkgver=1.0.8
pkgrel=2
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
sha256sums_aarch64=('29462c81215f0f8362da45f8c0b634b1d3ab7b9cc79280d6a6766c391ac0d7ed')
sha256sums_armv7h=('ebe2ad74836ec0a247cef3a3415a6c8ab7752f4eddad6b2e0bcb8f9c6051bffe')
sha256sums_x86_64=('812b46145a47066877f2ed5824d762b72d3d8587c4672eee4c4fdaa13086a154')
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