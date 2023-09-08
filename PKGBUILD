# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saberfy
_pkgname=Saberfy
pkgver=2.1.0
pkgrel=1
pkgdesc="Application for match and import your Spotify favorite songs to BeatSaber"
arch=('x86_64')
url="https://github.com/LoliE1ON/Saberfy"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('mesa' 'nss' 'libx11' 'glib2' 'gdk-pixbuf2' 'dbus' 'at-spi2-core' 'libxrandr' 'libxext' 'libxcb' 'libxfixes' 'gtk3' \
    'glibc' 'libxdamage' 'libxkbcommon' 'cairo' 'alsa-lib' 'expat' 'libdrm' 'gcc-libs' 'nspr' 'libxcomposite' 'libcups' 'pango')
makedepends=('gendesk' 'npm>=8' 'nodejs>=16')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('286f7e66f345d9b62d7b8fd1ec06e26911009907b6a1e91cafc6e9cfb0a7dfbf')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}