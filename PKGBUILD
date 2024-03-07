# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-rdm
_pkgname="Tiny RDM"
pkgver=1.1.9
_nodeversion=18
pkgrel=2
pkgdesc="A modern lightweight cross-platform Redis desktop manager"
arch=('any')
url="https://redis.tinycraft.cc/"
_ghurl="https://github.com/tiny-craft/tiny-rdm"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'go>=1.21'
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [ `curl ifconfig.co/country` == "China" ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
        export GOPROXY=https://goproxy.cn
    fi
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
    npm install --prefix ./frontend
    wails build -platform linux -ldflags "-X main.version=v${pkgver}" -o "${pkgname}"
    sed -e "s|{{.Info.ProductName}}|${_pkgname}|g" \
        -e "s|/usr/local/bin/${pkgname}|${pkgname}|g" \
        -e "s|{{.Info.Comments}}|${pkgdesc}|g" \
        -i "build/linux/${pkgname}_0.0.0_amd64/usr/share/applications/${pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.git/build/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.git/build/linux/${pkgname}_0.0.0_amd64/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}