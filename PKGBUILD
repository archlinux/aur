# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=polar-bin
_pkgname=Polar
pkgver=2.1.0
_electronversion=13
pkgrel=2
pkgdesc="One-click Bitcoin Lightning networks for local app development & testing"
arch=("x86_64")
url="https://lightningpolar.com/"
_ghurl="https://github.com/jamaljsr/polar"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'docker'
    'docker-compose'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-V${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jamaljsr/polar/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('b70d69d93768114354b73c0f54843c9fb7ca433a91a53567cce9442caffdadeb'
            '971e947b52af09847d493b326953f2cbc91669441eab0d5e74eac38b8e162904'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}