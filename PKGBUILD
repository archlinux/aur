# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="tilde-podcast-appimage"
pkgver=1.0.0
pkgrel=4
pkgdesc="Podcast client to listen to all you favorite podcasts"
arch=('x86_64')
url="https://github.com/paologiua/tilde"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'hicolor-icon-theme' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Tilde-${pkgver}.AppImage"
    "LICENSE::${url}/raw/main/LICENSE")
sha256sums=('36d92737e95db21231d580de2dd28b8d970f0872dec4f4f8e2e7143742f83702'
            'f1492bf906d1183083c07f5074b51ea36dc616136bf76d9f87e9a535a5345080')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/tilde-podcast.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 600x600 800x800 1024x1024 1600x1600 3200x3200;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}