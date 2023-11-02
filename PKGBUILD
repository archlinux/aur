# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=git-it-electron
pkgname="${_pkgname}-git"
_appname=Git-it
pkgver=5.2.2.r338.g8477248
pkgrel=1
pkgdesc="A Desktop App for Learning Git and GitHub"
arch=('any')
url="https://github.com/Git-it-App/git-it-electron"
license=('BSD')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=(
    'bash'
    'electron25'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs'
    'npm'
)
source=(
    "${_pkgname}.git"::"git+${url}.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            '0321bdf601741dceb78fdca449f1b2e1c90e7e3253729bf8d419b762c45ca47d')
pkgver() {
    cd "${srcdir}/${_pkgname}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --pkgname "${_pkgname}-git" --categories "Utility" --name="${_appname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${_pkgname}.git"
    npm install
    npm run build
    npm run pack-lin
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir:?}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${_pkgname}.git/out/${_appname}-linux-x64/resources/"{app,i18n} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${_pkgname}.git/assets/${_pkgname%-electron}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}