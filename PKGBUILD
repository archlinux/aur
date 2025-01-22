# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=avogadro2-bin
_pkgname=Avogadro2
pkgver=1.100.0
pkgrel=1
pkgdesc="An advanced molecular editor designed for cross-platform use in computational chemistry, molecular modeling, bioinformatics, materials science, and related areas."
arch=("x86_64")
url="https://two.avogadro.cc/"
_ghurl="https://github.com/OpenChemistry/avogadroapp"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bzip2'
    'libxml2'
    'e2fsprogs'
    'lz4'
    'libglvnd'
    'libxcb'
    'openssl-1.1'
    'qt5-base'
    'libgpg-error'
    'python-numpy'
    'python-requests'
    'glew'
)
makedepends=(
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${CARCH}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/OpenChemistry/avogadroapp/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('da4a25c8017f477df63b96326af2862e894eeadc153ce1a46a2f62fee1d64f8f'
            '3e6a55dc0da9bb56a7f232b1766da524c9d9c1dad61dfeea8424f1df7fb6f2f4'
            '6fbd133d746550a922dfeb351db679b1a18cf193774530bcab12ea6f0600938d')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}