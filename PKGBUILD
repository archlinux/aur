# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sunbible
_pkgname=SunBible
pkgver=2.0.001_beta
pkgrel=3
pkgdesc="Bible Desktop App"
arch=('any')
url="https://sunbible-dev.github.io/SunBible/"
_githuburl="https://github.com/SunBible-dev/SunBible"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron'
    'hicolor-icon-theme'
)
makedepends=(
    'yarn'
    'npm'
    'nodejs'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('20f6415de9e17d2dc39c7c61b75d1e4c0b672e538b351433bb616284fbcb074f'
            '10ceaab696a10a0043c12b0117b07cface986849a78796f2a85215609b69eb9c')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    yarn install
    yarn AppImage
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}