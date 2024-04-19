# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=veyon-bin
pkgver=4.8.3
pkgrel=2
pkgdesc="Cross-platform computer monitoring and classroom management"
arch=('x86_64')
url="https://veyon.io/"
_ghurl="https://github.com/veyon/veyon"
license=('GPL-2.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libfakekey'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxinerama'
    'libxrandr'
    'libxtst'
    'pam'
    'lzo'
    'libjpeg-turbo'
    'qca-qt5'
    'libpng'
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}.0-ubuntu.jammy_amd64.deb"
)
sha256sums=('acdc1c377696b182a13e6302a7f14e67082197580b6deb7a2d785035c2277f3e')

build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|Exec=|Exec=env LD_LIBRARY_PATH=\"/usr/lib/${pkgname%-bin}:/usr/lib\" |g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}-master.desktop"
    sed "s|Exec=|Exec=env LD_LIBRARY_PATH=\"/usr/lib/${pkgname%-bin}:/usr/lib\" |g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}-configurator.desktop"
}
package() {
    install -Dm644 "${srcdir}/lib/systemd/system/${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib/${CARCH}-linux-gnu/${pkgname%-bin}/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
}