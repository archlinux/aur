# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=commas-git
_pkgname=Commas
pkgver=0.29.2.r5.gaa67794
pkgrel=1
pkgdesc="A hackable, pluggable terminal, and also a command runner."
arch=('x86_64')
url="https://github.com/CyanSalt/commas"
license=('custom:ISC')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=(
    'bash'
    'electron26'
    'python'
)
makedepends=(
    'gendesk'
    'git'
    'nodejs>=14.0.0'
    'npm>=9.8.1'
)
source=(
    "${pkgname//-/.}"::"git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '655f23b13b3363e21e146209c1cc09c595e07fd15f05d01129b5a11e1ac690f2')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Utility" --name="${_pkgname}" --exec="${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    npm install
    npm add ansi-styles supports-color
    npm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/release/${_pkgname}-linux-x64/resources/app.asar" -t "${pkgdir:?}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/release/${_pkgname}-linux-x64/resources/"{app.asar.unpacked,bin} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/resources/images/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
