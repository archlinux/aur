# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=warpgui-bin
pkgver=2.5
pkgrel=1
pkgdesc="GUI for Cloudflare ™ WARP.(Prebuilt Version)"
arch=('x86_64')
url="https://github.com/AKotov-dev/warpgui"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk2'
    'cloudflare-warp-bin'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-0.mrx9.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('133e2e4ceba4ad72b54451b02ea084510b84ae890b622dd5139314ab00fdd1db'
            'b046dc662796f382c9300642d94724a97c20baf60de1fe9b34844a6a735aaf7d')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Exec=\/usr\/share\/${pkgname%-bin}\/${pkgname%-bin}/Exec=${pkgname%-bin} %U/g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}