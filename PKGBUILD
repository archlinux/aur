# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="teams-for-linux-appimage"
pkgver=1.1.9
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
sha256sums_aarch64=('818864d23e95698fa9933fe0b7f6b95cdbe60a751dcba748e9c1aba0d6db172f')
sha256sums_armv7h=('228021400cde649e541e746c18f9fbe730e00cdd783a11c699af6b8c99984fe7')
sha256sums_x86_64=('a9441eaf02f74fa4329fe5fcdfe13a1cc768606aea64d872b33eca0feac48feb')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
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