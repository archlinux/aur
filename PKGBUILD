# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mattermost-desktop-appimage"
pkgver=5.4.0
pkgrel=1
pkgdesc="Mattermost Desktop application for Linux(AppImage Version)"
arch=('aarch64' 'x86_64')
url="https://github.com/mattermost/desktop"
license=('Apache')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${pkgname%-appimage}-${pkgver}-linux-x86_64.AppImage")
sha256sums_aarch64=('461101b008f6df24d8350a4dd4469e2c367b220a130fdb987f1c7ed7985748dc')
sha256sums_x86_64=('8f9dbfc24423913156d306a45dc5b1edd817a746223f45e160b79d9bcae8eba0')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}