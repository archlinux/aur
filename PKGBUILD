# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
pkgname=authpass-bin
pkgver=1.9.13_2196
pkgrel=1
pkgdesc='Password Manager based on Flutter for all platforms. Keepass 2.x (kdbx 3.x) compatible.'
arch=('x86_64')
url="https://authpass.app/"
_ghurl="https://github.com/authpass/authpass"
_dlurl="https://authpass-data.codeux.design/data/artifacts"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libsecret'
    'libkeybinder3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/${pkgname%-bin}-linux-latest.deb"
    "pkgver.txt::${_dlurl}/${pkgname%-bin}-linux-latest.deb.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('e8ca3a897ab0b6125d71ccd247a67689208f01e6bbed37e4a114938283d30320'
            '8599907dc579a852bae3a663349e8a233272ce69786eb01658d733da94cc4818'
            'be541727a3d25cf73924738cde28da88ffd6a72cb71f9f2d748da5abdc5637d2')
pkgver() {
    cd "${srcdir}"
    cat "pkgver.txt"
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/icon\.svg/${pkgname%-bin}/g
        s/Network/Network;Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
}