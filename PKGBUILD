# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=drawio-desktop-git
pkgver=22.1.15.r1.g76845d3
_electronversion=28
_nodeversion=16
pkgrel=1
pkgdesc="A diagramming and whiteboarding desktop app based on Electron that wraps the core draw.io editor."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.diagrams.net/"
_ghurl="https://github.com/jgraph/drawio-desktop"
license=('Apache')
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'yarn'
    'npm'
    'nvm'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname "${pkgname%-git}" --categories "Graphics" --exec "${pkgname%-git}"
    cd "${srcdir}/${pkgname%-git}"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    sed "s|--publish always|--publish never|g" -i package.json
    sed '50,59d' -i electron-builder-linux-mac.json
    git submodule update --depth=1 --init --recursive
    yarn install --cache-folder "${srcdir}/.yarn_cache"
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
    install -Dm755 "${srcdir}/${pkgname%-git}/dist/${_architecture}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 96x96 128x128 192x192 256x256 512x512 720x720 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}/build/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}