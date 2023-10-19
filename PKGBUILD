# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kuro-git
_pkgname=Kuro
pkgver=9.0.0.r4.ge1a9799
pkgrel=1
pkgdesc="An elegant Microsoft ToDo desktop client for Linux (a fork of Ao)"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
makedepends=('npm' 'yarn' 'git' 'nodejs>=16.0.0' 'gendesk')
source=("${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'f342e565e6d8926a1499b4cf6540370b713d245589f45e688aa5e91a5eeb0bed')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')"
}
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|--publish never|--linux AppImage --publish never|g" -i package.json
    yarn
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/license.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}