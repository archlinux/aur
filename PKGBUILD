# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-chat-git
_pkgname=GhostChat
pkgver=4.5.0.r2.g1b3a9e6
_nodeversion=24
pkgrel=1
pkgdesc="A Standalone chat overlay for Twitch, Kick, YouTube and other streaming platforms."
arch=('any')
url="https://github.com/Enubia/ghost-chat"
license=('LicenseRef-DBAD')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'webkitgtk-6.0'
    'gtk3'
)
makedepends=(
    'pnpm'
    'gendesk'
    'go'
    'nvm'
    'curl'
    'git'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
    "modifiers_linux.go"
)
sha256sums=('SKIP'
            'b7f2400b0e956887b1e0d8cf4419c82726617503142b81b5c7ef3acbb1fc6798')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
    export HOME="${srcdir}/.electron-gyp"
    export PATH="${HOME}/go/bin:$PATH"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export pnpm_config_registry="https://registry.npmmirror.com"
            export npm_config_registry="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export GOPROXY=https://goproxy.cn,direct
        }
    fi
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    cp "${srcdir}/modifiers_linux.go" internal/hotkey/modifiers_linux.go
    go install github.com/wailsapp/wails/v3/cmd/wails3@latest
    cd "${srcdir}/${pkgname%-git}.git/frontend"
    NODE_ENV=development    pnpm install --frozen-lockfile
}
build() {
    _set_build_env
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git/build"
    go mod tidy
    wails3 generate bindings -f '-tags production -trimpath -buildvcs=false -ldflags="-w -s -X main.version=v4.0.1"' -clean=true -ts
    cd "${srcdir}/${pkgname%-git}.git/frontend"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname%-git}.git"
    go build -tags production -trimpath -buildvcs=false -ldflags="-w -s -X main.version=v4.0.1" -o "bin/${pkgname%-git}"
}
package() {
    install -Dm644 "${srcdir}/${pkgname%-git}.git/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
