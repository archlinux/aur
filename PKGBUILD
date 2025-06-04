# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linux-assistant-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A daily linux helper with powerful integrated search, routines checks and administrative tasks. The Project is built with flutter and python.(Prebuilt version)"
arch=('x86_64')
url="https://www.linux-assistant.org/"
_ghurl="https://github.com/Jean28518/linux-assistant"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'python-gobject'
    'python>3'
    'libkeybinder3'
    'flatpak'
    'wmctrl'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('0e0323fb41d9fec4f60828a0ed36cb415a20599907cd210c26cd2e5e66c4098a'
            '55e26214c0c668492818389c24db99827d7357bd4141294e264210160e6edc77')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g" \
        "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib64/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.${pkgname%-bin}.operations.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}