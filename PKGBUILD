# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=picgo-git
_pkgname=PicGo
pkgver=2.4.0.beta.6.r8cede85
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by vue-cli-electron-builder"
arch=('any')
url="https://molunerfinn.com/PicGo/"
_ghurl="https://github.com/Molunerfinn/PicGo"
license=('MIT')
depends=(
    'electron16'
)
makedepends=(
    'npm'
    'git'
    'nodejs>=16.0.0'
    'gendesk'
    'yarn'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '2146576ad96310d947adc76e44a6fa6692689081f9b5eb3f1d16aa61f27c97de')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "%s.r%s" "$(git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g;s/v//g')" "$(git rev-parse --short HEAD)"
}
build() {
    gendesk -f -n -q --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|build --publish always|build --linux AppImage --publish never|g" -i package.json
    yarn
    yarn global add xvfb-maybe spawn-sync
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist_electron/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
    install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}