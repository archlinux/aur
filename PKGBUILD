# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=claude-desktop
_pkgname=Claude-Desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="An Electron-based desktop application for Claude2(unofficial)."
arch=('any')
url="https://github.com/Karenina-na/Claude-Desktop"
license=('MIT')
conflicts=("${pkgname}")
depends=('libxfixes' 'libdrm' 'gtk3' 'nspr' 'libxdamage' 'mesa' 'expat' 'glib2' 'libcups' 'libxkbcommon' 'pango' 'alsa-lib' \
    'glibc' 'libxext' 'gcc-libs' 'libxcb' 'libxrandr' 'dbus' 'nss' 'libx11' 'libxcomposite' 'at-spi2-core' 'cairo')
makedepends=('gendesk' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('32b479fd3df2bf976e23d264a4f4ac011d15fadf73cda6b00ab9a0b86faaf1e2')
prepare() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run build
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist-client/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}