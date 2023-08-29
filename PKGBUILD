# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=thorium-reader-git
pkgver=r2525.a9630b9a
pkgrel=1
pkgdesc="A cross platform desktop reading app, based on the Readium Desktop toolkit"
arch=('any')
url="https://www.edrlab.org/software/thorium-reader/"
_githuburl="https://github.com/edrlab/thorium-reader"
license=('MIT')
conflicts=("${pkgname%-git}" "${pkgname%-reader-git}")
makedepends=('npm>=9.8' 'git' 'nodejs>=18.0.0' 'gendesk')
depends=('bash' 'electron25')
source=("git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '510f81cef10ab265922e3f6ae4b33dc9f996b95f23fbec5616696d05700ccdcc')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}"
    npm ci
    npm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/release/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.asar"
    install -Dm644 "${srcdir}/${pkgname%-git}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    gendesk -f -n --categories "Utility" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}