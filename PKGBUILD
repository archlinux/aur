# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chord-appimage
_pkgname=chord
pkgver=0.2.40
pkgrel=1
pkgdesc="Chord - A Modern Music Player"
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
conflicts=(chord-bin)
depends=(zlib hicolor-icon-theme)
options=(!strip)
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage"
)
sha512sums=('60ad941f1b2d65799eb9e94e21082b90ab4f0d726e1af706053a17a5c1decff58ab3fe4d585fdffe4be670703951eaa7079ea28e4f6c121e9823235ea9a2cf9a')
  
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    echo "Exec=${_install_path}/${_pkgname}.AppImage --no-sandbox %U" >> "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for icons in 16x16 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
