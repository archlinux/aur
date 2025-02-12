# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=termora-bin
_pkgname=Termora
pkgver=1.0.7
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
sha256sums=('c899004bb1413b43f123b96cd04bd495af3a797e78c0c1a6825c258f266bf91b'
            '9f840c608c863d6eff2d5e31d048e5815e98deeb861f42d4ac86c912fded11d0')
sha256sums_aarch64=('67ce4babb02814dbefb187ddc69d7b02a7ad8833a6895a9e9d51643c2876d093')
sha256sums_x86_64=('2516fda009101b682c81c7b94edda0a289ea020e6292e5877f01c703fe1b008e')
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