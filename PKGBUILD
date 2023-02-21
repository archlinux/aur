# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=csbooks-appimage
_pkgname=csBooks
pkgver=7.5.0
pkgrel=1
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader for windows, linux and mac os. 
        It solves your problems if you need ebook manager, library manager on linux, best comic book reader, cbz file reader, cbr file reader etc."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('custom')
options=(!strip)
conflicts=(
    'csbooks'
    'csbooks-bin'
    )
depends=(
    'zlib'
    'hicolor-icon-theme'
)
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/latest/${_pkgname}-${pkgver}.AppImage"
)
sha512sums=('64ee1f59ef0e5cfab64ab1082e056c64ae0c5e2e1153c7bd5937d477d634d70a3c3791b1e1ce3317dd17fbdf432f9575a463fcf19e01f7d39fbafda5574cd9a7')
 
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/csbooks.desktop"
    echo "Exec=/opt/appimages/csBooks.AppImage" >> "${srcdir}/squashfs-root/csbooks.desktop"
    echo "Icon=csbooks-appimage" >> "${srcdir}/squashfs-root/csbooks.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/csbooks.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/csbooks.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
