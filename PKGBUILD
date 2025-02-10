# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: fow0ryl <henning.ryll at web dot de>
pkgname=zoraxy-git
pkgver=3.1.7.r3.g2769558
pkgrel=1
pkgdesc='A general purpose HTTP reverse proxy and forwarding tool.'
arch=('any')
url="https://zoraxy.aroz.org/"
_ghurl="https://github.com/tobychui/zoraxy"
license=('AGPL-3.0-only')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=()
makedepends=(
    'git'
    'go'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.service"
)

sha256sums=('SKIP'
            'e38e83de069d7f79d3172e85d4b6577457909804fecb8146aacbe59c6cbf6c57')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
}
build() {
    cd "${srcdir}/${pkgname//-/.}/src"
    go mod tidy
    go build
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src/${pkgname%-git}" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.service" -t "${pkgdir}/usr/lib/systemd/system"
}