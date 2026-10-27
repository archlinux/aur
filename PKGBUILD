# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avogadro2-bin
_pkgname=Avogadro2
_appname="org.openchemistry.${_pkgname}"
pkgver=2.1.0
pkgrel=1
pkgdesc="An advanced molecular editor designed for cross-platform use in computational chemistry, molecular modeling, bioinformatics, materials science, and related areas."
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
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OpenChemistry/avogadroapp/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-aarch64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-x86_64.AppImage")
sha256sums=('3e6a55dc0da9bb56a7f232b1766da524c9d9c1dad61dfeea8424f1df7fb6f2f4'
            '0d625edc1abc14e5971788272ff95412cc4851274633c34b94144541609b92ac')
sha256sums_aarch64=('ebb909acc1f8b9a03b14a600b07466205094511489d8deb7cf482bfff52bc1db')
sha256sums_x86_64=('712d6f8e4f4481b6d1305a7ce93c9d1ec90109f5507740efccb2d5ce6e9b2823')
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
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/usr/share/icons" -type f \( -name "*.png" -o -name "*.svg" \) \
        -exec install -Dm644 {} -t "${pkgdir}/usr/share/icons/hicolor/{}" \;
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
