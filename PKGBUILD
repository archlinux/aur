# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-rdm-git
_pkgname="Tiny RDM"
pkgver=1.1.11.r0.gfc0deac
_nodeversion=18
pkgrel=1
pkgdesc="A modern lightweight cross-platform Redis desktop manager"
arch=('any')
url="https://redis.tinycraft.cc/"
_ghurl="https://github.com/tiny-craft/tiny-rdm"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'go'
    'gcc'
    'base-devel'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        export GOPROXY=https://goproxy.cn
    else
        echo "Your network is OK."
    fi
    go install github.com/wailsapp/wails/v2/cmd/wails@latest
    npm install --prefix ./frontend
    wails build -platform linux -o "${pkgname%-git}"
    sed -e "s|{{.Info.ProductName}}|${_pkgname}|g" \
        -e "s|/usr/local/bin/${pkgname%-git}|${pkgname%-git}|g" \
        -e "s|{{.Info.Comments}}|${pkgdesc}|g" \
        -i "build/linux/${pkgname%-git}_0.0.0_amd64/usr/share/applications/${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/build/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux/${pkgname%-git}_0.0.0_amd64/usr/share/applications/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}