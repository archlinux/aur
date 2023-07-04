# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="favicon-generator"
pkgver=0.1.1
pkgrel=1
pkgdesc="Small Electron based app to generate favicon in different formats."
arch=('any')
url="https://github.com/anthonypauwels/favicon-generator"
license=('custom')
conflicts=("${pkgname}" "${pkgname}-appimage")
depends=('libvips' 'pango' 'gdk-pixbuf2' 'libxext' 'glib2' 'libcups' 'at-spi2-core' 'libx11' 'libxcb' 'nspr' 'gtk3' 'cairo' 'libxdamage' \
    'libxcomposite' 'python' 'dbus' 'expat' 'gcc-libs' 'glibc' 'mesa' 'libdrm' 'nss' 'libxkbcommon' 'alsa-lib' 'libxrandr' 'libxfixes' 'libxshmfence')
makedepends=('pnpm' 'electron' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b379f24df4fceb2c3eb8aba66ee0cf43b80e2a59f7db5805317e4d4a1481a3b4')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install && pnpm dist
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname}" --categories "Graphics;Utility" --name "Favicon Generator" --exec "/opt/${pkgname%}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}