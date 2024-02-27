# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=flaru
pkgname="${_appname}-player-bin"
_pkgname="Flaru Player"
pkgver=1.13.5
_electronversion=27
pkgrel=3
pkgdesc='An "unofficial" emulator based on Ruffle Flash Emulator. Created to provide a friendly interface and enhanced playing experience. It is a complete alternative to Adobe Flash Player. Run Flash Safely Anywhere'
arch=('x86_64')
url="https://github.com/jooy2/flaru"
license=("LicenseRef-custom")
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname// /.}.${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jooy2/flaru/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('af81ddd6a4abec83fc95c90e37f5c9f055a686239ecd716d56524464cac1d092'
            '22f86a10f95ec7f4695c4d39a1df4464a6d61d7fe457dcd9181d71d530b0b70a'
            '0fb7b939a071f4a08476bdd5aa143d2aa8cd335c83309f9919be16cd5c3e2014')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${_appname}\"|${pkgname%-bin}|g;s|=${_pkgname}|=${pkgname%-bin}|g;s|Game|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|global.ENV_IS_DEV?xe|!global.ENV_IS_DEV?xe|g" -i "${srcdir}/app.asar.unpacked/dist/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}