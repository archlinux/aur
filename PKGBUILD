# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=notable-appimage
_pkgname=Notable
pkgver=1.8.4
pkgrel=1
epoch=
pkgdesc="The Markdown-based note-taking app that doesn't suck."
arch=("x86_64")
url="https://notable.app/"
_githuburl="https://github.com/notable/notable"
license=('Unlicensed')
depends=('hicolor-icon-theme' 'zlib')
options=(!strip)
optdepends=()
provides=("Notable")
conflicts=('notable-bin' 'notable-insiders-bin' 'notable-insiders-electron')
install=
_install_path="/opt/appimages"
source=(
    "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    )
sha256sums=('7ee59f198613f35e8cdb21b73dc100cb1798201716ed9b108e5398a8f9477f67')
     
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/notable.desktop"
    echo "Exec=/opt/appimages/Notable.AppImage" >> "${srcdir}/squashfs-root/notable.desktop"
    find "${srcdir}/squashfs-root/" -type d -exec chmod 755 {} \;
}
     
package() {
    mkdir -p "${pkgdir}/usr/share"
    cp -r "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/notable.desktop" "${pkgdir}/usr/share/applications/notable.desktop"
}