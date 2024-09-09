# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsecure-bin
_pkgname="Password Secure"
pkgver=1.2024.09.09
pkgrel=1
pkgdesc="A cross-platform password manager that uses strong AES-256 encryption."
arch=(
    "aarch64"
    "x86_64"
)
url="https://github.com/mihnea-radulescu/passwordsecure"
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
    'gendesk'
    'icoutils'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('54fc67f08f2fa40dae9b97e10438c7c41693c121ca5854759ec45baa5f930c9e')
sha256sums_x86_64=('43eb8b4cf1bb3305c222063c95dc3cc70a0c754bbcb6c2a17e70425d79fa0814')
build() {
    sed -e "
        s|@appname@|${pkgname%-bin}|g
        s|@runname@|${_pkgname// /}|g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    icotool -i 1 -x "${srcdir}/${_pkgname// /}_Linux_"*/ApplicationIcon.ico -o "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname// /}_Linux_"*/"${_pkgname// /}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname// /}_Linux_"*/*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname// /}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}