# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nora-bin
_pkgname=Nora
pkgver=2.4.0_stable
pkgrel=1
pkgdesc="An elegant music player built using Electron and React. Inspired by Oto Music for Android by Piyush Mamidwar."
arch=('x86_64')
url="https://github.com/Sandakan/Nora"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26' 'hicolor-icon-theme' 'openslide')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-Setup-${pkgver//_/-}-linux-amd64.deb"
    "LICENSE.txt::https://raw.githubusercontent.com/Sandakan/Nora/v${pkgver//_/-}/LICENSE.txt"
    "${pkgname%-bin}.sh")
sha256sums=('ed3dcca34469eff3383bae2b5a76c338aee1541492e7667a1c4726edb23510bc'
            '7c27f3771d31e4ba1a227b2aec04ff8892512ba80dd0fb9435115a6523e2980e'
            'a69569e21611da0510a1aba9b886eb4801afca4ff18c991b6ea2814f645c97c9')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${srcdir}"
    mkdir -p "${srcdir}/app.asar.unpacked/.erb/dll"
    cp "${srcdir}/app.asar.unpacked/dist/main/"* "${srcdir}/app.asar.unpacked/.erb/dll"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/assets" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}