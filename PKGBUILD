# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded-Avalonia
pkgver=1.2024.01.07
pkgrel=1
pkgdesc="ImageFan Reloaded is a light-weight image viewer, supporting multi-core processing."
arch=(
    "aarch64"
    "x86_64"
)
url="https://github.com/mihnea-radulescu/imagefanreloaded"
license=(
    "GPL3"
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
    'imagemagick'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}-Linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('34004e3dda91bc5d52361f2103bfd513439298bbb6adca945fb4de3e6f1767ff')
sha256sums_aarch64=('c75b734ec5cb35f2d88e8d3efb91ff83c2626cf963803573b0019fae6563f267')
sha256sums_x86_64=('c8eeb4db91dabd0f02221b20552061779043301df3accd942e9452553138ca77')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    convert "${srcdir}/${_pkgname}-Linux-"*/ApplicationIcon.ico "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --categories "Graphics" --name "${_pkgname}" --exec "env LC_CTYPE=en_US.UTF-8 ${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}-Linux-"*/"${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-Linux-"*/*.* -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-Linux-"*/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}