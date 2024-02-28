# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=grinplusplus-bin
_pkgname=GrinPlusPlus
pkgver=1.2.8
_electronversion=11
pkgrel=7
pkgdesc='A C++ Grin Node & Wallet For Linux'
arch=('x86_64')
url="https://grinplusplus.github.io"
_ghurl="https://github.com/GrinPlusPlus/GrinPlusPlus"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'openssl-1.1'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/GrinPlusPlus/GrinPlusPlus/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
options=('!strip')
sha256sums=('9d331477bec4bf78a54e0169ca862d5a269ca5e62ec27fc2897a0e6916d5621a'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname//Plus/+}/${pkgname%-bin}\"|${pkgname%-bin}|g;s|Finance|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${srcdir}/opt/${_pkgname//Plus/+}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|if (isDevMode)|if (!isDevMode)|g" -i "${srcdir}/app.asar.unpacked/build/electron-starter.js"
    sed "s|.\/app.asar.unpacked|.\/..\/..\/${pkgname%-bin}\/app.asar.unpacked|g" -i "${srcdir}/app.asar.unpacked/build/static/js/main.d30268e7.chunk.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname//Plus/+}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}