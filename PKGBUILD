# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quickpdfjoin-bin
_pkgname="Quick PDF Join"
_appname=QuickPdfJoin
pkgver=1.2024.08.20
pkgrel=1
pkgdesc="Quick PDF Join is a cross-platform application that joins multiple PDF files together."
arch=(
    "aarch64"
    "x86_64"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('a1144f712599af4c256116efd6af761fd372b09c635a14887042d0ffc0112b86')
sha256sums_aarch64=('fb17aeeb8379988581f1ffad22ee8bc1b35b111c864467fb433fd9fcd113db66')
sha256sums_x86_64=('43a262ccff183910fdc2702a63bf21f272a2308347e398ebd326390f2a157899')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
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