# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="gchat-bin"
_pkgname=GChat
pkgver=1.0.1
pkgrel=2
pkgdesc="Unofficial Google Chat app"
arch=('x86_64')
url="https://github.com/dcrousso/GChat"
license=('MIT')
depends=('cairo' 'hicolor-icon-theme' 'alsa-lib' 'libxrandr' 'dbus' 'pango' 'glib2' 'libcups' 'nss' 'libxcomposite' 'libxdamage' \
    'libdrm' 'at-spi2-core' 'libx11' 'libxfixes' 'libxext' 'libxkbcommon' 'glibc' 'libxcb' 'mesa' 'gcc-libs' 'nspr' 'expat' 'gtk3')
mkdenpends=('npm' 'gendesk')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6ac16d881642d156d9e3c01367edba538cde61efef2c46d07be0e504a42199bf')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run build-linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/dist/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/Icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "${_pkgname}" --exec "/opt/${pkgname%-bin}/${_pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}