# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="transmissionic-appimage"
pkgver=1.8.0
pkgrel=1
pkgdesc="Remote for Transmission Daemon"
arch=('x86_64')
url="https://github.com/6c65726f79/Transmissionic"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Transmissionic-linux-${arch}-v${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/6c65726f79/Transmissionic/main/LICENSE")
sha256sums=('cbda3a7a49bfdc54a84763bdda7c159b83607b660fa1e66d06d2cda1a9578532'
            '61a59d5ee8c459b5171700485c769d9efb67bf00cb2be4b6fe5561dcdef10191')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/transmissionic.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${pkgname%-appimage}.xml" -t "${pkgdir}/usr/share/mime"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}