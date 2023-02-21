# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zettlr-appimage
_pkgname=Zettlr
pkgver=2.3.0
pkgrel=1
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader for windows, linux and mac os.
        It solves your problems if you need ebook manager, library manager on linux, best comic book reader, cbz file reader, cbr file reader etc."
arch=('x86_64')
url="https://www.zettlr.com"
_githuburl="https://github.com/Zettlr/Zettlr"
license=('GPL3')
options=(!strip)
conflicts=(
    'zettlr'
    'zettlr-git'
    )
depends=()
_install_path="/opt/appimages"
source=(
  "${_pkgname}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
)
sha512sums=('0d5d84e28df6bd580431dd2cdecc1ed16ccf599e0a422877bca49424c7afd721d376ad6fc556fc1192919783075333bb5444c9e6c3cde1a1d55786c389f6a157')
  
prepare() {
    chmod a+x "${_pkgname}-${pkgver}-x86_64.AppImage"
    "./${_pkgname}-${pkgver}-x86_64.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/\#Icon=e/g' -i "${srcdir}/squashfs-root/Zettlr.desktop"
    echo "Exec=/opt/appimages/Zettlr.AppImage" >> "${srcdir}/squashfs-root/Zettlr.desktop"
    echo "Icon=zettlr-appimage" >> "${srcdir}/squashfs-root/Zettlr.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-x86_64.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
