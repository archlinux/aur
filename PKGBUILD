# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluestone
pkgver=0.8.3
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience."
arch=('any')
url="https://github.com/1943time/bluestone"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('alsa-lib' 'dbus' 'libxcomposite' 'gcc-libs' 'cairo' 'glibc' 'nss' 'pango' 'libxcb' 'mesa' 'libdrm' 'libxkbcommon' \
    'nspr' 'gtk3' 'expat' 'at-spi2-core' 'libxrandr' 'libxdamage' 'libcups' 'libx11' 'glib2' 'libxfixes' 'libxext')
makedepends=('pnpm' 'gendesk' 'npm>=8' 'nodejs>=16.14')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('06804a1dc1a06f816e2a6ea1955ec5460e39bf61797ebd0c659069a2d8538651')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    sed '/deb/d' -i electron-builder.yml
    pnpm run build
    pnpm run build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r  "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}