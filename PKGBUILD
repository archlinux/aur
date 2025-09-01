# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded
pkgver=1.2025.08.31
pkgrel=1
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/imagefanreloaded"
license=(
    "GPL-3.0-only"
    "MIT"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'fontconfig'
    'dotnet-runtime'
)
makedepends=(
    'imagemagick'
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('1307867171afb2960b1a9f223948dd09fa452bb89a550d4e60e9b7622d1783d4')
sha256sums_x86_64=('8321634ed29b4787a17dcd6841a2a13479cdd7252da3a62a9079e29ee8ee4dae')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    magick "${srcdir}/${_pkgname}_Linux_"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
