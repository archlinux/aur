pkgname=osmon-git
pkgver=1.1.0.r0.g752bcfa
pkgrel=1
pkgdesc="A command-line tool written in Go that provides quick access to basic system information. With osmon, you can easily access details such as your host's IP address, system load, memory usage, logged-in users, and much more."
arch=('any')
url="https://github.com/debek/osmon"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=()
makedepends=(
    'git'
    'go>=1.21.5'
    'curl'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
    go build -v ./...
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}