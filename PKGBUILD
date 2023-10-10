# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thorium-reader-git
pkgver=r2539.1d3dc939
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('any')
url="https://www.edrlab.org/software/thorium-reader/"
_githuburl="https://github.com/edrlab/thorium-reader"
license=('MIT')
conflicts=("${pkgname%-git}" "${pkgname%-reader-git}")
provides=("${pkgname%-git}" "${pkgname%-reader-git}")
makedepends=('npm>=9.0.0' 'git' 'nodejs>=18.0.0' 'gendesk')
depends=('bash' 'electron25')
source=("${pkgname%-git}.git::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '0efcaea1ff166a7d8dc8279d18b842c793490af6ec411deb8305ccce5d70cdca')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    npm ci
    npm run package:pack-only
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}