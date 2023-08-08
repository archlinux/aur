# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revenote
pkgver=1.0.0_alpha.1
pkgrel=1
pkgdesc="A lightweight productivity tool to build Second Brain that integrates note-taking and whiteboarding features."
arch=('x86_64')
url="https://revenote.com/"
_githuburl="https://github.com/revenote/revenote"
license=('MPL2')
conflicts=("${pkgname}")
depends=('expat' 'libxdamage' 'at-spi2-core' 'glibc' 'gcc-libs' 'glib2' 'libxext' 'gtk3' 'alsa-lib' 'libxfixes' 'nss' \
    'libxcomposite' 'libxcb' 'nspr' 'libdrm' 'dbus' 'libxkbcommon' 'cairo' 'pango' 'libxrandr' 'libx11' 'mesa' 'libcups')
makedepends=('pnpm' 'nodejs' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('a07c3d693fe316b805a3d726c39bcfc3a43488e77b85b41ad6a728409ba188a1')
build() {
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    pnpm install
    sed '34,35d' -i electron-builder.yml
    pnpm add is-url electron-is-dev ms github-url-to-object
    pnpm run build:linux
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Office;Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}