# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nora-bin
_pkgname=Nora
pkgver=2.5.0_stable
_electronversion=27
pkgrel=4
pkgdesc="An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar."
arch=('x86_64')
url="https://github.com/Sandakan/Nora"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-Setup-${pkgver//_/-}-linux-amd64.deb"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Sandakan/Nora/v${pkgver//_/-}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('dbbe88f6d1e5f219c546c026bdbbf7d5d8ff7c360f2ec6a6610ec837ea57a25a'
            '7c27f3771d31e4ba1a227b2aec04ff8892512ba80dd0fb9435115a6523e2980e'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/app.asar.unpacked/dist/main/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    cp "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" "${srcdir}/opt/${_pkgname}/resources/assets/icon.png"
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}