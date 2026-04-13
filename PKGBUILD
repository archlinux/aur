# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quickpdfjoin-bin
_pkgname='Quick PDF Join'
_appname=QuickPdfJoin
pkgver=1.2026.04.10
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
    'dotnet-runtime>=10'
)
makedepends=(
    'gendesk'
    'icoutils'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${_pkgname// /}_Linux_x64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('6aca7dfd3abf71dd91e7b5d6a6d78084c8d52cf5df2564d3889b07e6621940c4')
sha256sums_aarch64=('86c42b834a798e77a602c9400a03d09603f0da4c7de6ca90e19d8eb347fe0bf7')
sha256sums_x86_64=('b0004522c5df100bd37c590478912f86d199bb5bfc0091876ecd5b8c567cb359')
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
