# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=museeks-appimage
_pkgname=museeks
pkgver=0.13.1
pkgrel=1
pkgdesc="A simple, clean and cross-platform music player"
arch=("x86_64")
url="https://github.com/martpie/museeks"
license=(MIT)
depends=(hicolor-icon-theme zlib)
options=(!strip)
optdepends=()
provides=()
conflicts=(museeks-bin)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
sha256sums=('2efba7842166a6fd344e75f35a3a779105008682a99a9ea9a8a81c694a9957ea')
        
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=AppRun/#Exec=AppRun/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=/opt/appimages/museeks.AppImage --no-sandbox %U"  >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
        
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
}
