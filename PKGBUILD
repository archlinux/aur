# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flashpoint-launcher
pkgver=12.1.1
pkgrel=1
pkgdesc="A desktop application used to browse, manage and play games from Flashpoint Archive"
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
_githuburl="https://github.com/FlashpointProject/launcher"
license=('MIT')
conflicts=("${pkgname}" "${pkgname%-launcher}")
depends=('php' 'alsa-lib' 'nspr' 'glib2' 'pango' 'libxdamage' 'at-spi2-core' 'expat' 'python' 'gtk3' 'libxrandr' 'libcups' 'libxext' \
    'libxkbcommon' 'mesa' 'nss' 'dbus' 'libxcb' 'libxfixes' 'libx11' 'cairo' 'libxcomposite' 'libdrm' 'glibc' 'gcc-libs')
makedepends=('gendesk' 'npm>=8' 'nodejs>=16.20.1' 'rust' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43be71ade5f220b5296d0e2f29c808c65e95b58adf461e42c1b4b756ebb464a1')
build() {
    cd "${srcdir}/launcher-${pkgver}"
    yarn
    sed 's|"deb", ||g' -i gulpfile.js
    yarn release:linux
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname},usr/bin}
    cp -r "${srcdir}/launcher-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/launcher-${pkgver}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/launcher-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}