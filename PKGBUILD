# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluestone
pkgver=0.7.2
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience."
arch=('any')
url="https://github.com/1943time/bluestone"
license=('AGPL3')
conflicts=("${pkgname}")
depends=('alsa-lib' 'dbus' 'libxcomposite' 'gcc-libs' 'cairo' 'glibc' 'nss' 'pango' 'libxcb' 'mesa' 'libdrm' 'libxkbcommon' \
    'nspr' 'gtk3' 'expat' 'at-spi2-core' 'libxrandr' 'libxdamage' 'libcups' 'libx11' 'glib2' 'libxfixes' 'libxext')
makedepends=('pnpm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b29182031f612ae98648cad89e880806e2b3d9661e2cee47c010ba1e2acbc949')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pnpm install
    sed '43d' -i electron-builder.yml
    sed '81d' -i src/renderer/src/components/Nav.tsx
    sed '72d' -i src/renderer/src/components/Nav.tsx
    sed '8,9d' -i src/renderer/src/components/Nav.tsx
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