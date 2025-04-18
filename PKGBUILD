# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=popcorn-fx-bin
_pkgname=popcorn-time
pkgver=0.8.2
pkgrel=3
pkgdesc="A multi-platform torrent streaming client that includes an integrated media player with support for embedded devices such as the Raspberry PI.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/yoep/popcorn-fx"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}" "${_pkgname//_/ }")
depends=(
    'alsa-lib'
    'openssl'
    'libxtst'
    'libxrender'
    'dbus'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('06c3c895ac5c4e914a0e4a74c8f631e38edd45100aee39bdd660a70ce8c4defc'
            'af5fdb44fbb692da78a402bfa7bdf6ff45d853082b5ef461e9c9524365310abe')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/\/opt\/${_pkgname}\/${_pkgname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}