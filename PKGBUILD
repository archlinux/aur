# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=dosbox
pkgname="${_pkgname}-staging-bin"
pkgver=0.80.1
pkgrel=4
pkgdesc="A modern continuation of DOSBox with advanced features and current development practices."
arch=("x86_64")
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
provides=("${pkgname%-bin}=${pkgver}" "${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=('glibc' 'alsa-lib' 'sdl2' 'hicolor-icon-theme' 'libglvnd' 'gcc-libs' 'sdl2_image' 'sdl2_net')
source=("${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-v${pkgver}.tar.xz")
sha256sums=('12582a6496b1a276cd239e6b3d21ddfcd51fd8f9e40a1ebbc0a3800e0636190a')
prepare() {
    mv "${srcdir}/${pkgname%-bin}-linux-v${pkgver}" "${srcdir}/${pkgname%-bin}"
    sed "s|Exec=${_pkgname}|Exec=${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}/desktop/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}"/{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -s "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/desktop/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}/doc/manual.txt" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/man/${_pkgname}".1 -t "${pkgdir}/usr/share/man/man1"
    for _icons in 16x16 22x22 24x24 32x32 scalable;do
        install -Dm644 "${srcdir}/${pkgname%-bin}/icons/hicolor/${_icons}/apps/${pkgname%-bin}".* \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}