# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quickpdfjoin-bin
_pkgname='Quick PDF Join'
_appname=QuickPdfJoin
pkgver=1.2025.10.12
pkgrel=1
pkgdesc="Quick PDF Join is a cross-platform application that joins multiple PDF files together.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/mihnea-radulescu/quickpdfjoin"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('e8a8e960360316b45a8ced27098a004f7469d3640dfd0328818143bf9fda55c5')
sha256sums_x86_64=('8d7304186cdae7661372ad25c50a5d780644a4c5cc539162be7d73e9c1207047')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    icotool -i 1 -x "${srcdir}/${_appname}_Linux_"*/ApplicationIcon.ico -o "${srcdir}/${pkgname%-bin}.png"
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_appname}_Linux_"*/"${_appname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_appname}_Linux_"*/*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}_Linux_"*/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
