# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-maintainer: Edu4rdSHL <edu4rdshl@protonmail.com>
pkgname=waveterm
_pkgname=Wave
_appname="${_pkgname} Terminal"
pkgver=0.7.1
_electronversion=29
_nodeversion=20
pkgrel=3
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=('any')
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
    'nodejs'
    'git'
    'go>=1.18'
    'scripthaus'
    'base-devel'
    'zip'
    'nvm'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories="Utility" --name="${_appname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
        export GOPROXY=https://goproxy.cn
    else
        echo "Your network is OK."
    fi
    sed "s|-l -p never|--dir|g" -i scripthaus.md
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    yarn add -D electron-rebuild
    scripthaus run electron-rebuild
    scripthaus run build-backend
    scripthaus run build-package-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/make/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/make/linux-"*/resources/app.asar.unpacked "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/src/app/assets/${pkgname}-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}