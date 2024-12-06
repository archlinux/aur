# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=woterm-bin
_pkgname=WoTerm
pkgver=9.30.4
_releasedate=202403031942
pkgrel=1
pkgdesc="Easy to Use / Practical / Powerful / Modern (Prebuilt version)一款易用、实用、强大、现代的跨平台终端"
arch=("x86_64")
url="http://woterm.com/"
_ghurl="https://github.com/aoyiduo/woterm"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=("!strip")
depends=(
    'qt5-base'
    'postgresql-libs'
    'qt5-location'
    'qt5-declarative'
    'unixodbc'
    'openssl-1.1'
    'gtk3'
    'qt5-remoteobjects'
    'qt6-charts'
    'qt6-declarative'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::https://down.woterm.com/linux/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-202403031942.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('7448cf1be61436cba1fcd2e4213d4ef2e7545b0279c595bec86155eceddb618b'
            '2c72a969289598f9c407cb36a9720ad3b6a85173551252369515a0422cc53077')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-linux-${CARCH}-v${pkgver}-${_releasedate}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}
