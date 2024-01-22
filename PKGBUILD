# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nora-bin
_pkgname=Nora
pkgver=2.5.0_stable
_electronversion=27
pkgrel=2
pkgdesc="An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar."
arch=('x86_64')
url="https://github.com/Sandakan/Nora"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
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
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    mkdir -p "${srcdir}/app.asar.unpacked/.erb/dll"
    cp "${srcdir}/app.asar.unpacked/dist/main/preload.js" "${srcdir}/app.asar.unpacked/.erb/dll"
    cp "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" "${srcdir}/opt/${_pkgname}/resources/assets/icon.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
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