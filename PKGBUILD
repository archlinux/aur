# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqable-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_ghurl="https://github.com/reqable/reqable-app"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'xz'
    'libdbusmenu-gtk3'
    'libgcrypt'
    'gtk3'
    'libayatana-appindicator'
    'libepoxy'
    'libayatana-indicator'
    'libgpg-error'
    'lz4'
    'pango'
    'nspr'
    'util-linux-libs'
    'cairo'
    'harfbuzz'
    'at-spi2-core'
    'gdk-pixbuf2'
    'nss'
    'libdbusmenu-glib'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-app-linux-${CARCH}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('f2143757a75ae99d25888278838fc2ea5498a31d74315b2e66152389ef88c9f3'
            '23392e1a40e734a004a13faec6db357230d1a3893a849ceaba3d25079a403630'
            '728911f1eb0f8ac69af459050cf1aade3b6ca658e9f2242462fa1408256fde9f')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}