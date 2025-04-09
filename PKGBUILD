# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
_pkgname=BlueBubbles
pkgver=1.15.4
_subver=2B73
pkgrel=1
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Android, PC (Windows, Linux, & even macOS), and Web!(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://bluebubbles.app/"
_ghurl="https://github.com/BlueBubblesApp/bluebubbles-app"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'webkit2gtk-4.1'
    'gdk-pixbuf2'
    'mpv'
    'libdbusmenu-glib'
    'libnotify'
    'libappindicator-gtk3'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar::${_ghurl}/releases/download/v${pkgver}%${_subver}-desktop/${pkgname%-bin}-linux-aarch64.tar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar::${_ghurl}/releases/download/v${pkgver}%${_subver}-desktop/${pkgname%-bin}-linux-x86_64.tar")
source=("${pkgname%-bin}.sh")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('5e0e9b227350c0ac4d90c4b057723c119b71e2d28bf72e185f08418ca5422a7a')
sha256sums_x86_64=('cda82d393adac50f810f669f08dc1c1f9b646c539d37f78673a70f64508bfc44')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -f -n -q \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}