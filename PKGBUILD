# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
pkgver=0.9.396_2294
pkgrel=2
pkgdesc="Achieve your goals and keep your data private with Lotti. This life tracking app is designed to help you stay motivated and on track, all while keeping your personal information safe and secure. Now with on-device speech recognition."
arch=('x86_64')
url="https://github.com/matthiasn/lotti"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pango'
    'gdk-pixbuf2'
    'jsoncpp'
    'gtk3'
    'libkeybinder3'
    'libsecret'
    'libepoxy'
    'cairo'
    'at-spi2-core'
    'harfbuzz'
)
makedepends=('gendesk')
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver//_/+}/linux.x64.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/matthiasn/lotti/${pkgver//_/+}/assets/icon/app_icon_1024.png"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('a3c3fa5ae7c8a1130d1ed71c809e6c445af9eec850537552f50aaca3c8b3b210'
            '306adaeff6c8613e536db665d24cab8551b4a3774c5729492dd132dc690256c6'
            '265b344a9c97f52feffb1c9fb07fee8919e31abe8e9e15aed6ccf76e3c49440c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/opt/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}