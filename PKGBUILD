# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=revenote
pkgver=1.0.0_alpha.0
pkgrel=2
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
sha256sums=('285d153ca3c14a6bd887643a0a3c06e349df180dcd7108e4c95442a0ac0659ed')
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