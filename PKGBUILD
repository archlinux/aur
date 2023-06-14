# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="teams-for-linux-appimage"
pkgver=1.1.3
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=('GPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc' 'fuse2')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-armv7l.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
sha256sums_aarch64=('7b551c563c898b13a1bdb174350e174707fd41ecdb3f91bd5e5baf0eff016f88')
sha256sums_armv7h=('f01c5cf73295898b6a6d02705318bf82735756e002bfe7a6ec42e455a0efd52d')
sha256sums_x86_64=('2b0de3dd584633ccf64cb8b5ea218121c30a4c0effc370a06c9f65c6cc0e0c19')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "./${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}