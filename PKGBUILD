# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=realesrgan
pkgname="${_appname}-gui-bin"
_pkgname="Real-ESRGAN GUI"
pkgver=0.2.5.0
_pkgver=autobuild_20240602_060617
pkgrel=3
pkgdesc="Cross-platform GUI for image upscaler Real-ESRGAN with additional features. Now with Real-CUGAN support!(Prebuilt version)"
arch=('x86_64')
url="http://akarin.dev/realesrgan-gui/"
_ghurl="https://github.com/TransparentLC/realesrgan-gui"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'vulkan-icd-loader'
    'zlib'
    'gcc-libs'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${_ghurl}/releases/download/${_pkgver//_/-}/${pkgname%-bin}-ubuntu-bundled-v${pkgver}.tar.xz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/TransparentLC/realesrgan-gui/${_pkgver//_/-}/icon-1024px.png"
)
sha256sums=('faf3f876ec173ed98c4ba7a5724aad2efa0088fbb1608639503ff822d484ff33'
            'a989cff54510fcdd651a0e6d1818288ce7633cc6ba968adf6dd92bb21b813831')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
    touch "${srcdir}/${pkgname%-bin}/config.ini"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname%-bin}"  "${pkgdir}/usr/lib/"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    chmod 666 "${pkgdir}/usr/lib/${pkgname%-bin}/config.ini"
}