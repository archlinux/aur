# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huelectron-bin
_pkgname=huElectron
pkgver=0.6.1
pkgrel=4
pkgdesc="An open-source and cross-platform app for the Hue lighting system from Philips - built on Electron."
arch=(x86_64)
url="https://github.com/4ch1m/huElectron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('mesa' 'expat' 'libdrm' 'libxcb' 'at-spi2-core' 'libx11' 'gcc-libs' 'libxext' 'alsa-lib' 'glib2' 'libxfixes' \
    'libxdamage' 'libxkbcommon' 'pango' 'nspr' 'gtk3' 'libxcomposite' 'cairo' 'dbus' 'nss' 'libxrandr' 'libcups' 'glibc')
makedepends=(
    'asar'
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/4ch1m/huElectron/${pkgver}/app/img/icon.png"
)
sha256sums=('8d3ea2043a7fee5a83a6ff34b97b93acc7cb98318e2ff08d827bb2a8ca5bd94f'
            '1f3f81918f9254f49488f0a113f55bd1da262b9300026d927b21cd10e895bcc6')
build() {
    gendesk -q -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    asar e "${srcdir}/${_pkgname}-linux-x64/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "4i process.env['ELECTRON_DISABLE_SECURITY_WARNINGS'] = 'true';" -i "${srcdir}/app.asar.unpacked/app/js/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}