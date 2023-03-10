# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuview-appimage
_pkgname=yuview
_orginame=de.rwth_aachen.ient.YUView
pkgver=2.13
pkgrel=1
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('any')
url="http://ient.github.io/YUView"
_githuburl="https://github.com/IENT/YUView"
license=('GPL3')
options=(!strip)
conflits=(yuview)
depends=(zlib hicolor-icon-theme)
source=("${_pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v.${pkgver}/YUView.AppImage")
sha256sums=('91b521f1b55fb396e5b873c633d464d4fd33fb1ca95eeaedff3a7b8a06cf774f')
_install_path="/opt/appimages"
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract
    sed 's/Exec=/\#Exec=/g;s/Icon=/#Icon=/g' -i "${srcdir}/squashfs-root/${_orginame}.desktop"
    echo "Exec=/opt/appimages/yuview.AppImage %F" >> "${srcdir}/squashfs-root/${_orginame}.desktop"
    echo "Icon=yuview" >> "${srcdir}/squashfs-root/${_orginame}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    for _icons in 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/local/share/icons/hicolor/${_icons}/apps/${_orginame}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_orginame}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
