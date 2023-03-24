# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=csbooks
pkgname="${_pkgname}-appimage"
pkgver=7.5.0
pkgrel=3
pkgdesc="csBooks is the best epub reader, pdf reader, mobi book reader and djvu reader."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('custom')
options=(!strip)
conflicts=("${_pkgname}")
depends=(zlib hicolor-icon-theme glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/latest/csBooks-${pkgver}.AppImage"
    "LICENSE::${url}/privacy-policy")
sha256sums=('cd3f352fede998f933eaa929809e60cb15745968ae01460845bb531d471e57fa'
            '9e45f7627b17b6f7dbfa93c96c98c88e90405629835ffaf3c3acab2243f2ef64')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/Exec=/Exec=\/opt\/appimages\/csbooks.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
} 
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}