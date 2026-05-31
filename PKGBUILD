# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wonkey-bin
_pkgname=Wonkey
pkgver=2026.05
pkgrel=1
pkgdesc="An easy to learn, oriented object, modern and cross-platform programming language for creating cross-platform video games."
arch=('x86_64')
url="https://wonkey-coders.github.io/"
_ghurl="https://github.com/wonkey-coders/wonkey"
license=('Zlib')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'python'
    'gawk'
    'libpulse'
    'openal'
    'perl'
    'libxi'
    'libx11'
)
makedepends=(
    'gendesk'
    'imagemagick'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.tgz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x64.tgz"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.tgz")
sha256sums=('01103db7deac2722cdeb62803d3dafb0f423540d77ec01acbb9f9cfcde817246'
            'fda209fc72032ab69f3265b004e8dd21953d02c9a710d97eae261d8d40e1539d')
prepare() {
    if [ -d "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64" ]; then
        rm -rf "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64"
    fi
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tgz" -C "${srcdir}"
    sed -i -e "
    	s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game;Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    magick "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64/src/wide/logo/wide.ico" "${srcdir}/${pkgname%-bin}.png"
    mv "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64/${_pkgname}"* "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64/${_pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64/". "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-0.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_x64/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
