# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thorium-reader-git
pkgver=r2540.1f0decaa
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
source=("${pkgname//-g/.g}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'b4b89c1666a3893cf0e3733301cc328f81b70915b9e8041fe872d6d21b9c0e83')
pkgver() {
    cd "${srcdir}/${pkgname//-g/.g}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    gendesk -q -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-g/.g}"
    npm ci
    npm run package:pack-only
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/release/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-g/.g}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}