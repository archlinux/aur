# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sleek-appimage
_pkgname=sleek
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="todo.txt manager for Linux, Windows and MacOS, free and open-source (FOSS)"
arch=("x86_64")
url="https://github.com/ransome1/sleek"
license=('MIT')
depends=('libxss' 'libxtst' 'libnotify')
options=(!strip)
optdepends=()
provides=("ransome1")
conflicts=('sleek')
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    )
sha256sums=('2036165ee06c141b6a6e665a9601c403a2ad0b2ad1fb29334ce6eaa7e08f2e95')
    
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Categories=/#Categories=/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/sleek.AppImage" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Categories=Utility;" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
}
    
package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
