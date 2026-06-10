# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=passwordsecure-bin
_pkgname='Password Secure'
pkgver=1.2026.06.10
pkgrel=1
pkgdesc="A cross-platform password manager that uses strong AES-256 encryption.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/passwordsecure"
license=(
    'GPL-3.0-only'
    'MIT'
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
    'gendesk'
    'icoutils'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('7edec0ae6cd837a1b89476fb7f6e9f1d2ae344b7e90f2c6fa59003d2e82ff348')
sha256sums_x86_64=('a85c577f2276f2ac06e326efada7a0ae6b2329f7d54c8c3d80aa2f5fb025dd50')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname// /}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    icotool -i 1 -x "${srcdir}/${_pkgname// /}_Linux_"*/ApplicationIcon.ico -o "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname// /}_Linux_"*/"${_pkgname// /}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname// /}_Linux_"*/*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname// /}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
