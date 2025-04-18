# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuview-bin
_pkgname=YUView
_appname="de.rwth_aachen.ient.${_pkgname}"
pkgver=2.13
pkgrel=5
pkgdesc="The Free and Open Source Cross Platform YUV Viewer with an advanced analytics toolset.(Prebuilt version)"
arch=('x86_64')
url="http://ient.github.io/YUView"
_ghurl="https://github.com/IENT/YUView"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'libgpg-error'
    'harfbuzz'
    'fontconfig'
    'libx11'
    'libice'
    'libsm'
    'libglvnd'
)
makedepends=(
    'fuse2'
)
options=("!strip")
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('91b521f1b55fb396e5b873c633d464d4fd33fb1ca95eeaedff3a7b8a06cf774f'
            'fac8a8f216777a45004e1b3c016a3c8aeecb713eb0a0e9bab429a155c75b7cbb')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/${_pkgname} %F/${pkgname%-bin} %F/g
        s/${_appname}/${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/local/"{bin,lib,plugins} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/local/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/local/share/mime/packages/${_appname}.xml" \
        "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/squashfs-root/local/share/metainfo/${_appname}.appdata.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
}