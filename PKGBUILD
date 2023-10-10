# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Conor Anderson <conor@conr.ca>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=wire-desktop-git
pkgver=3.32.3079.r59.ga4e2f8ac
pkgrel=1
pkgdesc='End-to-end encrypted messenger with file sharing, voice calls and video conferences'
arch=('any')
url="https://wire.com/"
_githuburl="https://github.com/wireapp/wire-desktop"
license=('GPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('bash' 'electron26' 'xdg-utils')
makedepends=('git' 'npm>=6.14.18' 'nodejs>=14.21.3' 'yarn' 'gendesk')
optdepends=('emoji-font: colorful emoji')
source=("${pkgname%-git}.git::git+${_githuburl}.git"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'f472bd72db26cb19739dd463ec75ff69bacab3f367d887ce2da170ff12148b4f')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    gendesk -q -f -n --categories "Network" --name "${pkgname%-git}" --exec "${pkgname%-git}"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    yarn
    yarn build:linux:internal
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/wrap/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}