# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=kuro-git
_pkgname=kuro
_appname=Kuro
pkgver=r620.e1a9799
pkgrel=1
pkgdesc="An elegant Microsoft ToDo desktop client for Linux (a fork of Ao)"
arch=('any')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('npm' 'yarn' 'git' 'nodejs>=16.0.0' 'gendesk' 'hicolor-icon-theme')
depends=('bash' 'electron22')
source=("${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'ac6a6cba890697d277d410679964518d8a80172772ecb98a6f4829db417d6a4f')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    yarn install
    sed "s|--publish never|--linux AppImage --publish never|g" -i package.json
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.asar"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    gendesk -f -n --categories "Utility" --name "${_appname}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/license.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}