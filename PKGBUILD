# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masscode-git
_pkgname=massCode
pkgver=v3.10.0.r1.g2e3500b
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers"
arch=('any')
url="https://masscode.io/"
_githuburl="https://github.com/massCodeIO/massCode"
license=('MIT')
makedepends=('npm' 'pnpm>=8.0.0' 'git' 'nodejs>=16.15.0' 'gendesk')
depends=('bash' 'electron16')
source=("${pkgname//-/.}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'd87bbdc2b2585aa2a572ed38898c94ae127e7ff6beab0aee26cd0624eea55bd6')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --tags | sed 's/\w\+\///g;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
    gendesk -q -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    sed "s|snap|AppImage|g" -i config/electron-builder.ts
    pnpm install
    pnpm run build
    pnpm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname//-/.}/config/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}