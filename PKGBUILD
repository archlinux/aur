# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuview-appimage
_pkgname=YUView
_appname="de.rwth_aachen.ient.${_pkgname}"
pkgver=2.13
pkgrel=6
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset"
arch=('x86_64')
url="http://ient.github.io/YUView"
_ghurl="https://github.com/IENT/YUView"
license=('GPL3')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=(
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
options=("!strip")
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.AppImage")
sha256sums=('91b521f1b55fb396e5b873c633d464d4fd33fb1ca95eeaedff3a7b8a06cf774f')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -e "s|${_pkgname} %F|${pkgname%-appimage} --no-sandbox %F|g" \
        -e "s|${_appname}|${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "${_install_path}/${pkgname%-appimage}.AppImage" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    for _icons in 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/local/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/local/share/mime/packages/${_appname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-appimage}.xml"
    install -Dm644 "${srcdir}/squashfs-root/local/share/metainfo/${_appname}.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-appimage}.appdata.xml"
}