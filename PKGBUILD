# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moosync-appimage
_pkgname=moosync
pkgver=7.1.0
pkgrel=1
pkgdesc="Music player capable of playing local audio or from Youtube, Spotify and many more"
arch=("x86_64")
url="https://moosync.app/"
_githuburl="https://github.com/Moosync/Moosync"
license=(GPL3)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=(moosync)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('17d9fe350dfd294add21ce9c9717a38f0bbd1b5f9b1be749a08c39140f78357d')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g;s/Utility/Utility;AudioVideo/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/${_pkgname}.AppImage --no-sandbox %U"  >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
