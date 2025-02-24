# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=termora-bin
_pkgname=Termora
pkgver=1.0.9
pkgrel=1
pkgdesc="A terminal emulator and SSH client.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/TermoraDev/termora"
license=(
    'AGPL-3.0-only'
    'LicenseRef-Proprietary'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'java-runtime>=21'
    'alsa-lib'
    'libxi'
    'libx11'
    'libxrender'
    'libxtst'
)
makedepends=(
    'gendesk'
)
source=(
    "LICENSE.md::https://raw.githubusercontent.com/TermoraDev/termora/${pkgver}/README.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarh64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86-64.tar.gz")
sha256sums=('f62e9b95a7093318756e07436e47c6a4150e551f72516e92d04f26d298db2cea'
            '9f840c608c863d6eff2d5e31d048e5815e98deeb861f42d4ac86c912fded11d0')
sha256sums_aarch64=('7b4ae752f8f24c7630d41e0e8ce4cae2fabbffa2b2518f3388bc6ed6f56b0129')
sha256sums_x86_64=('7857a0e85b4abc1fc78b3ff7d3525608996b96393985dcc184b20c072ccbb0fa')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="System" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
   cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"*  "${pkgdir}/usr/lib/${pkgname%-bin}"
   install -Dm644 "${srcdir}/${_pkgname}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
   install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
   install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}