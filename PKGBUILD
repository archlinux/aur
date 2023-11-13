# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deskaide-bin
_appname=Deskaide
pkgver=1.0.0_alpha.16
pkgrel=4
pkgdesc="An aide to your desk life!"
arch=('x86_64')
url="https://github.com/deskaide/deskaide"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
    'hicolor-icon-theme'
    'lib32-gcc-libs'
    'lib32-glibc'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/deskaide/deskaide/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4abe8efb3fb909daf2f9034bc164155f77a9033a3699802c6ceb5ea3b32610b5'
            '60fcc2fb41c30d5afc1767a98ddec84656bdd10e2f563c0fb11cba23c5cbc271'
            'e08b619911a79f86c5889d45921cf8665f6b254c69fe3363e4321fa2c3fc4e3a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"{app.asar.unpacked,buildResources} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 72x72 96x96 128x128 144x144 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}