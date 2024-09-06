# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded
pkgver=1.2024.09.06
pkgrel=1
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing."
arch=(
    "aarch64"
    "x86_64"
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
    'dotnet-runtime>=8'
)
makedepends=(
    'imagemagick>=7'
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}_Linux_arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}_Linux_x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('3b236fa8e8a49c17a6fb02f633a96a91e7221aece76dadcf249a01e298e53b66')
sha256sums_x86_64=('81c5bf1b735c078c42b06877a5a519f8a3c607279cab880e204225835c1ddb8b')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    magick "${srcdir}/${_pkgname}_Linux_"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Graphics" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}