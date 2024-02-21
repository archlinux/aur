# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dosbox
pkgname="${_pkgname}-staging-bin"
pkgver=0.81.0
pkgrel=1
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices."
arch=("x86_64")
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL-2.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_pkgname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
)
depends=(
    'alsa-lib'
    'sdl2'
    'hicolor-icon-theme'
    'libglvnd'
    'sdl2_image'
    'sdl2_net'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('034b08a941a7fd0279a81b10af620999c569f7e81b786e7f4b59a0b94e46d399'
            '8e4b518b19641352cabe2604117457d45ecf8b252f789113590f47e376ff4461')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-linux-v${pkgver}/"* "${srcdir}/opt/${pkgname%-bin}"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/desktop/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/desktop/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/doc/manual.txt" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/man/${_pkgname}".1 -t "${pkgdir}/usr/share/man/man1"
    for _icons in 16x16 22x22 24x24 32x32 scalable;do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/icons/hicolor/${_icons}/apps/${pkgname%-bin}".* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}