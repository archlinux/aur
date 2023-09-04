# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=znote-appimage
pkgver=2.3.8
pkgrel=1
pkgdesc="A Beautiful markdown editor inspired by Jupyter."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://znote.io"
_githuburl="https://github.com/alagrede/znote-app"
license=('custom')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage")
source=("LICENSE.html::${url}/cgu.html")
sha256sums=('e3bccfecd7907b680442058909b67f64b525a3b1bd18d3fc9dc5ccf68342b118')
sha256sums_aarch64=('1f2dd8ef3f07238a8bf3d87335dfabd303b20b0491b43bdc9b233c6b062e8648')
sha256sums_armv7h=('1f2dd8ef3f07238a8bf3d87335dfabd303b20b0491b43bdc9b233c6b062e8648')
sha256sums_x86_64=('2844fa04c58963be614cd7f0f55670fbeb49158e2ef5baba25a779923e4c252c')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for icons in 8x8 32x32 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}