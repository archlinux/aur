# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluebubbles-bin
_pkgname=BlueBubbles
pkgver="2.1.6+desktop.96"
pkgrel=1
pkgdesc="A cross-platform app ecosystem, bringing iMessage to Android, PC (Windows, Linux, & even macOS), and Web!"
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
    'libayatana-appindicator'
    'libayatana-indicator'
    'ayatana-ido'
    'gtk3'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x86_64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('a46613b6df5ea182d243b68fa5ed3df97f307cf9d81788c9ff4c0e1d6f671dfe')
sha256sums_aarch64=('bd92dd372c6c495bf79a86d90f3ed7cd2dc73b00866ca632636e68aa1dac1d20')
sha256sums_x86_64=('10d52a9c1f9180ec8ae2e180bf9d52070f39d6f4d4da63526ca7ba1406603150')
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
    cp -a "${srcdir}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/data/flutter_assets/assets/icon/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    ln -sf "/usr/lib/libmpv.so" "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libmpv.so.1"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
