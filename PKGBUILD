# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-calculator-bin
_pkgname="Electron Calculator"
pkgver=1.1.2
_electronversion=22
pkgrel=5
pkgdesc="Simple electron calculator app"
arch=('x86_64')
url="https://github.com/Alex313031/electron-calculator"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Alex313031/electron-calculator/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a24c56eb012c763c6c10ddf137ff4c72c0d8898776083baed52085bb78023664'
            '0971f64facd7071ec5e71edbac78a59937e0a82e1b1599ee45e5ce0e4735623e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"\
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}