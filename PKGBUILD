# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=airdrop_tool
pkgname="${_pkgname//_/-}-bin"
_appname="Bitshares Airdrop tool"
pkgver=0.3.20
pkgrel=2
pkgdesc="Fetch & analyse blockchain tickets. View leaderboards and user tickets. Calculate and perform provably fair airdrops."
arch=('x86_64')
url="https://github.com/BTS-CM/airdrop_tool"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libx11' 'nss' 'dbus' 'expat' 'cairo' 'alsa-lib' 'libxcb' 'libxext' 'mesa' 'libxfixes' 'libxkbcommon' 'at-spi2-core' \
    'libdrm' 'gcc-libs' 'glibc' 'libxcomposite' 'libcups' 'glib2' 'nspr' 'libxrandr' 'libxdamage' 'pango' 'gtk3')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}.deb"
    "LICENSE::https://raw.githubusercontent.com/BTS-CM/airdrop_tool/v${pkgver}/License.md")
sha256sums=('3e14258bc7b643cea135bc0f1d5c63a035390ce7722b7ad5986bbf879861469d'
            '48ecd55adc52c7a1ad9e3f699b9e2348bca9bb6797ce8ad4e9cbe38f7aa11c8a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    rm -rf "${srcdir}/opt/${_appname}/resources"
    install -Dm644 "${srcdir}/app.asar" -t "${srcdir}/opt/${_appname}/resources"
    sed "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin} --no-sandbox|g;s|=${_pkgname}|=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}