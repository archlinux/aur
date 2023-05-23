# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ocat-appimage"
pkgver=20230020
pkgrel=1
pkgdesc="OpenCore Auxiliary Tools is a GUI-based Configurator for editing config.plist files for Acidanthera's OpenCore Boot Manager."
arch=("x86_64")
url="https://github.com/ic005k/OCAuxiliaryTools"
license=("MIT")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
conflit=("${pkgname%-appimage}")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/OCAT-Linux-${arch}.AppImage"
        "LICENSE::https://raw.githubusercontent.com/ic005k/OCAuxiliaryTools/master/LICENSE")
sha256sums=('9f2a83c06cdfedc935efa153f824e9f76a84498be8f9a373b555680d701ee784'
            '3515a1c9e2ce8df51e80f0a03a0ffca92430c7dca6989ff20b16031d676a652b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|Exec=OCAuxiliaryTools|Exec=/opt/appimages/ocat.AppImage|g;s|Icon=icon|Icon=ocat|g;s|Categories=Application|Categories=Utility|g' \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}