# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=sshuttle_gui
pkgname="${_pkgname//_/-}-bin"
pkgver=0.3
pkgrel=1
pkgdesc="GUI for SShuttle - Transparent proxy server that works as a poor man's VPN. Forwards over ssh."
arch=('x86_64')
url="https://github.com/AKotov-dev/SShuttle-GUI"
license=("GPL-3.0-only")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-gui-bin}"
)
depends=(
    'gtk2'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-0.mrx9_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('c6ab0de12eca7b2f307a774c89866548e4f9cc0363531e93b4a4744c5df9d646'
            'd4b8aa180a4fadebb52de6343ef56501affba634eadff0ed9a493aab20da442d')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/${pkgname%-bin}.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}