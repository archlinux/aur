# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=picgo-git
_pkgname=PicGo
pkgver=r512.dca6667
pkgrel=1
pkgdesc="A simple & beautiful tool for pictures uploading built by vue-cli-electron-builder"
arch=('any')
url="https://molunerfinn.com/PicGo/"
_githuburl="https://github.com/Molunerfinn/PicGo"
license=('MIT')
makedepends=('npm' 'git' 'nodejs>=16.0.0' 'gendesk' 'graphicsmagick' 'xz' 'libicns' 'yarn')
depends=('bash' 'electron16')
source=("git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '1bcd48bbd3e1d1eb6958f5c0d8662d84ce3bb2b5b49022fc5c8888c258c84c84')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    yarn
    yarn global add xvfb-maybe spawn-sync
    sed "s|build --publish always|build --linux AppImage --publish never|g" -i package.json
    yarn release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${_pkgname}/dist_electron/linux-unpacked/resources/app.asar" "${pkgdir}/opt/${pkgname%-git}/${pkgname%-git}.asar"
    install -Dm644 "${srcdir}/${_pkgname}/build/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}