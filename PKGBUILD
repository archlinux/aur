# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saberfy
_pkgname=Saberfy
pkgver=2.1.0
pkgrel=2
pkgdesc="Application for match and import your Spotify favorite songs to BeatSaber"
arch=('x86_64')
url="https://github.com/LoliE1ON/Saberfy"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron16'
)
makedepends=(
    'gendesk'
    'npm>=8'
    'nodejs>=16'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('286f7e66f345d9b62d7b8fd1ec06e26911009907b6a1e91cafc6e9cfb0a7dfbf'
            '378db7fb377cc8920353a38c4569a140276a443897d39761dc5c06130a19d225')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package
    sed "s|reg.exe|reg|g" -i "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app/.webpack/main/index.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname}/swiftshader"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}