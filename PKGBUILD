# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ripes
_appname=Ripes
pkgname="${_pkgname}-appimage"
pkgver=2.2.6
pkgrel=1
pkgdesc="A graphical processor simulator and assembly editor for the RISC-V ISA"
arch=("x86_64")
url="https://github.com/mortbopet/Ripes"
license=(MIT)
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin")
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Ripes-v${pkgver}-linux-x86_64.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('065cc364897f2181dd0c4d32decb6d7e38309ae12ed1319a52e6648223cd55db'
            '2af9cacb9ee73bed57c14ae509681749e1b12521878ce3a9b4f64add0b572078')
       
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=Ripes/Exec=\/opt\/appimages\/ripes.AppImage/g;s/Icon=Ripes/Icon=ripes/g' -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}