# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ghost-chat-git
_pkgname=GhostChat
pkgver=4.0.1.r0.g492767d
_nodeversion=24
pkgrel=1
pkgdesc="A Standalone chat overlay for Twitch, Kick, YouTube and other streaming platforms."
arch=('any')
url="https://github.com/Enubia/ghost-chat"
license=('LicenseRef-DBAD')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'webkit2gtk-4.1'
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
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    local HOME="${srcdir}/.electron-gyp"
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
        export CGO_ENABLED=1
        export GO111MODULE=on
        export GOOS=linux
        export GOCACHE="${srcdir}/go-build"
        export GOMODCACHE="${srcdir}/go/pkg/mod"
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export GOPROXY=https://goproxy.cn,direct
        }
    fi
    cp "${srcdir}/modifiers_linux.go" internal/hotkey/modifiers_linux.go
    go install github.com/wailsapp/wails/v3/cmd/wails3@latest
    cd "${srcdir}/${pkgname%-git}.git/frontend"
    NODE_ENV=development    pnpm install --frozen-lockfile
}
build() {
    local HOME="${srcdir}/.electron-gyp"
    export PATH="${HOME}/go/bin:$PATH"
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