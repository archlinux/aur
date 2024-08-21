# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsecure-bin
_pkgname="Password Secure"
pkgver=1.2024.08.20
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
sha256sums=('c128534b3c66bb0e25dd972a4af7ab851787d228ae273b6e78a626f87f7fd3a6')
sha256sums_aarch64=('1ceee8c991b14e886ae298f0ac8a7bf78a3be3177987bea135be817011aab3e1')
sha256sums_x86_64=('33023e2cf95bec5de521a16c7610abaad1da7028df3a8a1497e7154e5a5740c4')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname// /}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
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