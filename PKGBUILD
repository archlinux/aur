# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded
pkgver=1.2024.07.02
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
sha256sums=('3974088aa9b0c1b19da2026da113d2b26af63b3b84e885a23c3b0ed8b0499f56')
sha256sums_aarch64=('f14f62eb39e82f87a783abd1f03fe7ecffbd1bd98660c1db03b3f481fdeb2139')
sha256sums_x86_64=('b1a75d4c99c2d5bd449260348bcf1f5db0951241fd0234725f3f3c12d65bcb0a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    magick "${srcdir}/${_pkgname}_Linux_"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Graphics" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}_Linux_"*/"${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/*.* -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}