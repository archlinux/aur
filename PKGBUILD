# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drawio-desktop-appimage
_pkgname=drawio
pkgver=20.8.16
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=('x86_64')
url="https://www.diagrams.net/"
_githuburl="https://github.com/jgraph/drawio-desktop"
license=('Apache2')
options=(!strip)
conflicts=(drawio-desktop)
depends=('zlib' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-x86_64-${pkgver}.AppImage")
sha512sums=('2940baa2afd0168e169c31b6533c12d4bcd91f8e28be9b8803a032d237ee41a73c7b1ceb7025792dd3f85acedffe184431b80fe2671a657553c84be2b46a05e2')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
