# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linux-assistant-bin
pkgver=0.5.6
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
sha256sums=('24bf65c83659b4f0c91e7d727671a2c8a6a7e30ecb5ba8ae95372a0461a2fb17'
            '55e26214c0c668492818389c24db99827d7357bd4141294e264210160e6edc77')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
     sed "s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${pkgname%-bin}.png/${pkgname%-bin}/g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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