# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=reqable-bin
pkgver=2.4.1
pkgrel=1
pkgdesc="A cross platform professional HTTP development and Debugger that supports HTTP1, HTTP2, and HTTP3 (QUIC) protocols"
arch=('x86_64')
url="https://reqable.com"
_ghurl="https://github.com/reqable/reqable-app"
license=('LicenseRef-custom')
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
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-app-linux-${CARCH}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('cef804c655fe21bd7c11428cfbcd0901b7fef679e0044681f2a0a9ed722c8b51'
            '23392e1a40e734a004a13faec6db357230d1a3893a849ceaba3d25079a403630'
            'd00425e6ff378959e512ceb27e2056f4b0a6d2d8934b6c91e93720d91ffe8446')
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