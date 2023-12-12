# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=imagefanreloaded-avalonia-bin
_pkgname=ImageFanReloaded-Avalonia
pkgver=1.2023.12.12
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
sha256sums=('cd87dcfa438cbda7cee315933d5c260629bbe09ac6201b8bf37993c8ab1610cc')
sha256sums_aarch64=('2ab5a92e4e11c98fbd7d3c257e723d440d24a5c570936338b49371ceafc46d20')
sha256sums_x86_64=('de3ea357dc38cd0f5d1f7a9aea6f4e6727df96a7592970ad2fba74cf7b43e83a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${_pkgname}|g" \
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