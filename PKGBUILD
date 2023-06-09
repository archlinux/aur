# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="nudge-bin"
_appname=Nudge
pkgver=0.4
pkgrel=1
pkgdesc="An electron-powered application focused on personal health"
arch=('any')
url="https://github.com/aasmart/Nudge"
license=('custom')
options=()
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('mesa' 'libxcomposite' 'alsa-lib' 'libdrm' 'dbus' 'nspr' 'gcc-libs' 'libxcb' 'gtk3' 'libxrandr' 'glibc' 'cairo' 'libxext' \
    'glib2' 'nss' 'libcups' 'libxdamage' 'at-spi2-core' 'libx11' 'libxfixes' 'libxkbcommon' 'pango' 'expat')
makedepends=('npm' 'electron' 'gendesk')
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('81a65a4df587f7cfa05779c03c5a761f0de20ccb5b466fb19b1c78fae8a4b4dc')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    chmod +x ./node_modules/.bin/electron-forge
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_appname}-${pkgver}/out/${_appname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/resources/app/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${_appname}" --exec "/opt/${pkgname%-bin}/${_appname} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}