# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avogadro2-bin
_pkgname=Avogadro2
_appname="org.openchemistry.${_pkgname}"
pkgver=2.0.0
pkgrel=2
pkgdesc="An advanced molecular editor designed for cross-platform use in computational chemistry, molecular modeling, bioinformatics, materials science, and related areas.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://two.avogadro.cc/"
_ghurl="https://github.com/OpenChemistry/avogadroapp"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'e2fsprogs'
    'libglvnd'
    'libxcb'
    'libgpg-error'
    'python-requests'
    'glew'
)
options=('!strip')
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OpenChemistry/avogadroapp/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-aarch64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
sha256sums=('3e6a55dc0da9bb56a7f232b1766da524c9d9c1dad61dfeea8424f1df7fb6f2f4'
            '0d625edc1abc14e5971788272ff95412cc4851274633c34b94144541609b92ac')
sha256sums_aarch64=('f7cfac39aa8df5d2ff712b5178c90ef87a49972b919e38b003015e9b3dd3c518')
sha256sums_x86_64=('9792b8a81069d3c7b855374ba580acd9950ca24c8c2173320c7841aa6c82452e')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i "s/Icon=${_appname}/Icon=${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml"
    # Replace build runner paths with correct installation paths
    find "${pkgdir}" -type f -exec sed -i 's|/home/runner/work/avogadrolibs/build/prefix|/usr/lib/avogadro2|g' {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_appname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
