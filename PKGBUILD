# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=drawio-desktop
pkgname="${_pkgname}-git"
pkgver=22.1.2.r1.g591f516
pkgrel=1
pkgdesc="A diagramming and whiteboarding desktop app based on Electron that wraps the core draw.io editor."
arch=('aarch64' 'x86_64')
url="https://www.diagrams.net/"
_ghurl="https://github.com/jgraph/drawio-desktop"
license=('Apache')
depends=(
    'electron25'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'yarn'
    'npm>=8.19.4'
    'nodejs>=16.20.2'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}.git::git+${_ghurl}.git"
    "${_pkgname}.sh"
)
sha256sums=('SKIP'
            'd6f15f16128807f9bdc6e04e6872cdcf2121ccfebb2688739d7a6586985f926d')
pkgver() {
    cd "${srcdir}/${_pkgname}.git"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    gendesk -q -f -n --pkgname "${_pkgname}-git" --categories "Graphics" --name "${_pkgname}" --exec "${_pkgname}"
    cd "${srcdir}/${_pkgname}.git"
    sed "s|--publish always|--publish never|g" -i package.json
    sed '50,59d' -i electron-builder-linux-mac.json
    git submodule update --depth=1 --init --recursive
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
    install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}.git/dist/${_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/${_pkgname}.git/build/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}