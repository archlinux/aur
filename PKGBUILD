# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=brisk-bin
_pkgname=Brisk
pkgver=2.3.2
pkgrel=1
pkgdesc="Fast, multithreaded, cross-platform download manager.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/AminBhst/brisk"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libkeybinder3'
    'libayatana-indicator'
    'ayatana-ido'
    'libayatana-appindicator'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.tar.xz")
source=(
    "${pkgname%-bin}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${CARCH}.tar.xz"
    "${pkgname%-bin}.sh"
)
sha256sums=('f32afa9880d9572ea6f22a615550f43f3e516577a9959ac4a03cc11dfdbf88bb'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.xz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/data/flutter_assets/assets/icons/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}