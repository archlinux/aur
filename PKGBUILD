# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epub-reader
_pkgname=Epub-Reader
pkgver=1.0.5
pkgrel=4
pkgdesc="Epub/Book Reader Application built with ElectronJS"
arch=('any')
url="https://mignaway.github.io/epub-reader-website/"
_githuburl="https://github.com/mignaway/EpubReader"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'bash'
    'electron18'
    'libxcrypt-compat'
)
makedepends=(
    'yarn'
    'npm'
    'nodejs>=16.13.2'
    'gendesk'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('db951ca3860576e8810343b145009ccd3b5719185517b227950bb3caa27bbc9c'
            'c0aca09503b24676b99565e7687ee51362737612969270e8ac8f3474327e71ff')
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${_pkgname//-/}-${pkgver}"
    yarn 
    yarn dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname//-/}-${pkgver}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm755 "${srcdir}/${_pkgname//-/}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname//-/}-${pkgver}/src/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}