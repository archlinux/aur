# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=claude-desktop
_pkgname=Claude-Desktop
pkgver=0.0.5
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
sha256sums=('2f3ce4a9402f288eb28b811f4ac79ad85bfbbaa9b4e9c69538d8923b275a1fd1')
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
    gendesk -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}