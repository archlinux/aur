# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-appimage
_pkgname=sleek
pkgver=1.3.1
pkgrel=1
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
depends=(zlib hicolor-icon-theme)
options=(!strip)
optdepends=()
provides=("ransome")
conflicts=('sleek')
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('d3796449028e48f5fec5e4c3e4248799e4776a78a9766706d2deb9c8fa7256fb')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Categories=/#Categories=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/sleek.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Categories=Utility;" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}    
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
