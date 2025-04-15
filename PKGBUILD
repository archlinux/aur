# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ripes-bin
_pkgname=Ripes
pkgver=2.2.6
pkgrel=4
pkgdesc="A graphical processor simulator and assembly editor for the RISC-V ISA.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/mortbopet/Ripes"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libgpg-error'
    'libxcb'
    'libx11'
    'freetype2'
    'libglvnd'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mortbopet/Ripes/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('065cc364897f2181dd0c4d32decb6d7e38309ae12ed1319a52e6648223cd55db'
            '2af9cacb9ee73bed57c14ae509681749e1b12521878ce3a9b4f64add0b572078'
            '2f265c4afd90993bb2c4bf412ac5e4cf8168b5bff6db82821ff259d5c14db041')
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
        s/Exec=${_pkgname}/Exec=${pkgname%-bin} %U/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/io.github.mortbopet.${_pkgname}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}