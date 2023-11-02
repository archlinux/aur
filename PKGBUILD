# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=prospect-mail
pkgname="${_pkgname}-beta-bin"
_appname="Prospect Mail"
pkgver=0.5.2
pkgrel=1
pkgdesc="The Outlook desktop client for the new Outlook Interface from Microsoft 365."
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/julian-alarcon/prospect-mail"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=(
    'bash'
    'electron27'
    'hicolor-icon-theme'
)
makedepends=(
    'asar'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-aarch64.pacman")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-armv7l.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.pacman")
source=(
    "LICENSE::https://raw.githubusercontent.com/julian-alarcon/prospect-mail/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('d0e5830cefea162e44ae617ea67300234f69b9fc9c2c9e220ad2b56f9cc189df'
            '81844f0a829809c1192377f78fd5c730f19b8556f038c1d7d137107f7c75a03a')
sha256sums_aarch64=('5e34e57f495623106338b34fa05cef14199ae7189cf2c91c04641070e24e4979')
sha256sums_armv7h=('7ec1e0a63c83b99b84ad565042927e4e6696b192b5d4fcd853c8059484438a7a')
sha256sums_x86_64=('60995b68d8224942c65172381bf098d233dc3194f9b2e1e90d50b236d8fa6513')
build() {
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    echo "process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" >> "${srcdir}/app.asar.unpacked/src/main.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|\"/opt/${_appname}/${_pkgname}\"  %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"    
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}