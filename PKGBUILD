# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord-appimage
pkgver=3.1.7
pkgrel=1
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('x86_64')
url="https://github.com/ArmCord/ArmCord"
license=('OSL3')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/ArmCord-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/ArmCord/ArmCord/dev/LICENSE")
sha256sums=('36da06c597b586ebfc9ae423753b8b8e40c077e6b6549979e672d270a6dacc9f'
            'c2cba32542cf3a65813e83fdbd259020d6d62b6833aa18f38aec983837dc9e4d')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/armcord.AppImage|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
    
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}