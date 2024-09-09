# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
# Maintainer: Evan Simkowitz <https://simkowitz.dev/>
pkgname=waveterm
_pkgname=Wave
_appname="${_pkgname} Terminal"
pkgver=0.7.6
_electronversion=30
_nodeversion=20
pkgrel=3
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.waveterm.dev/"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache-2.0')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gcc'
    'yarn'
    'gendesk'
    'npm'
    'go>=1.18'
    'scripthaus'
    'curl'
    'gcc'
    'zip'
    'curl'
    'nvm'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('78879dddc0d6fdc3c0c3cd3ee0ee5097c9641d867fd0ee7654a85c5997088947'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    sed -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@//
    " -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_appname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc.yml"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        echo 'npmRegistryServer: "https://registry.npmmirror.com"' >> "${srcdir}/.electron-gyp/.yarnrc.yml"
        go env -w GOPROXY=https://goproxy.cn,direct
    else
        echo "Your network is OK."
    fi
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    sed 's/"zip", "deb", "rpm", "AppImage", "pacman"/"dir"/' -i electron-builder.config.js
    corepack enable
    echo y | yarn set version 4.1.1
    NODE_ENV=development    yarn install #--cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=production     scripthaus run electron-rebuild
    NODE_ENV=production     scripthaus run build-backend
    NODE_ENV=production     scripthaus run build-package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/make/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/app/assets/${pkgname}-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}