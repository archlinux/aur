# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drawio-desktop-git
pkgver=22.0.2.r6.ge4e410d
pkgrel=1
pkgdesc="A diagramming and whiteboarding desktop app based on Electron that wraps the core draw.io editor."
arch=('aarch64' 'x86_64')
url="https://www.diagrams.net/"
_githuburl="https://github.com/jgraph/drawio-desktop"
license=('Apache')
depends=('bash' 'electron25')
makedepends=('gendesk' 'git' 'yarn' 'npm>=8.19.4' 'nodejs>=16.20.2')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${pkgname//-git/.git}::git+${_githuburl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'bf4c5e15fc4c98a07c32998d8b481aadce09d2d896caf2cdf16fce7d8f5dd7ae')
pkgver() {
    cd "${srcdir}/${pkgname//-git/.git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --categories "Graphics" --name "${pkgname%-git}" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname//-git/.git}"
    sed "s|--publish always|--publish never|g" -i package.json
    sed '50,59d' -i electron-builder-linux-mac.json
    git submodule update --init --recursive
    yarn
    yarn sync
    yarn release-linux
}
package() {
    case "${CARCH}" in
        x86_64)
            _architecture="linux-unpacked"
        ;;
        aarch64)
            _architecture="linux-arm64-unpacked"
        ;;
    esac
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 "${srcdir}/${pkgname//-git/.git}/dist/${_architecture}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-git}/resources"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname//-git/.git}/build/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-git/.git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}