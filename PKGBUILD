appname=zen
pkgname="${appname}-adblocker-git"
_pkgname=Zen
pkgver=0.10.0.r1.g0bf14bb
_nodeversion=22
pkgrel=1
pkgdesc="An open-source system-wide ad-blocker and privacy guard."
arch=('any')
url="https://zenprivacy.net/"
_ghurl="https://github.com/ZenPrivacy/zen-desktop"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'networkmanager'
    'glib2'
    'webkit2gtk'
)
makedepends=(
    'npm'
    'git'
    'go'
    'gendesk'
    'curl'
    'wails'
    'nvm'
    'go-task'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
)
sha256sums=('SKIP')
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
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    local HOME="${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
        echo 'registry=https://registry.npmmirror.com' >> frontend/.npmrc
		echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> frontend/.npmrc
    fi
    NODE_ENV=development npm install --prefix frontend
    wails build -o "${pkgname%-git}" -platform "linux" -ldflags "-X ./internal/cfg.Version=${pkgver}" -m -skipbindings
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/build/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/assets/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}