# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=before-dawn-bin
_pkgname="Before Dawn"
pkgver=0.26.0
pkgrel=2
pkgdesc="A desktop screensaver app using web technologies"
arch=('x86_64')
url="https://github.com/muffinista/before-dawn"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26' 'hicolor-icon-theme' 'glibc')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/muffinista/before-dawn/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('e1114355ac1a522628daf4ff5637694f3880918e6e4520d04c411f0fea6b2d28'
            '2f9c033e00d3ac09f44d4819c7701eae9c37ca21ca1da29f3488eadc1b3c3c51'
            '86743fe625d8342fb25bb53d69d611b255c09f9fffbf6ed84413116a494bd46d')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\" %U|${pkgname%-bin}|g;s|Amusement|System;Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}/resources"
    mkdir -p "${pkgdir}/opt/${pkgname%-bin}/resources/data"
    cp -r "${srcdir}/opt/${_pkgname}/resources/savers" "${pkgdir}/opt/${pkgname%-bin}/resources/data"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}