# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ubports-installer-bin
pkgver=0.10.0
_electronversion=25
pkgrel=4
pkgdesc="A simple tool to install Ubuntu Touch on UBports devices"
arch=('x86_64')
url="https://github.com/ubports/ubports-installer"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'libusb'
    'lib32-glibc'
    'lib32-gcc-libs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('a530f8fbb867b07aafdabf06459b2ffec5f64202a56f13bf87ca0c225b5b1189'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}