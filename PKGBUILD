pkgname=localjson-git
_pkgname=LocalJson
pkgver=2024.5.13.a0bc346.r43.gd6911ae
_nodeversion=18
pkgrel=1
pkgdesc="A lightweight cross-platform toolset based on Wails"
arch=('any')
url="https://localjson.vercel.app/"
_ghurl="https://github.com/inRemark/localjson"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'networkmanager'
    'glib2'
    'webkit2gtk'
)
makedepends=(
    'npm'
    'pnpm'
    'git'
    'go'
    'gendesk'
    'curl'
    'wails'
    'gcc'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    echo 'build_from_source=true'  >> .npmrc
    echo 'link-workspace-packages=true'  >> .npmrc
    echo 'fetch-retry-maxtimeout=10000'  >> .npmrc
    echo "cache-dir="${srcdir}"/.pnpm_cache"  >> .npmrc
    echo "store-dir="${srcdir}"/.pnpm_store"  >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        go env -w GOPROXY=https://goproxy.cn,direct
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/' >> .npmrc
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/' >> .npmrc
    else
        echo "Your network is OK."
    fi
    NODE_ENV=development    pnpm install --prefix ./frontend
    wails build -o "${pkgname%-git}" -m -skipbindings
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/build/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}