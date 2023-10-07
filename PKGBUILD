# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=masscode-git
_pkgname=massCode
pkgver=r467.2de7c85
pkgrel=1
pkgdesc="A free and open source code snippets manager for developers"
arch=('any')
url="https://masscode.io/"
_githuburl="https://github.com/massCodeIO/massCode"
license=('MIT')
makedepends=('npm' 'pnpm>=8.0.0' 'git' 'nodejs>=16.15.0' 'gendesk')
depends=('bash' 'electron16')
source=("git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'd87bbdc2b2585aa2a572ed38898c94ae127e7ff6beab0aee26cd0624eea55bd6')
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${_pkgname}"
    pnpm install
    pnpm run build
    sed "s|snap|AppImage|g" -i config/electron-builder.ts
    pnpm run release
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${_pkgname}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${_pkgname}/config/icons/256x256.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    gendesk -f -n --categories "Development;Utility" --name "${_pkgname}" --exec "${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}