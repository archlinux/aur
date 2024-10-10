# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scripthaus
pkgver=0.5.1
pkgrel=2
pkgdesc="ScriptHaus lets you run bash, Python, and JS snippets from your Markdown files directly from the command-line."
arch=('any')
url="https://www.scripthaus.dev/"
_ghurl="https://github.com/scripthaus-dev/scripthaus"
license=('MPL-2.0')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=(
    'glibc'
)
makedepends=(
    'go>=1.17'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9e03540d225659d93a36d4b18a993d02080b4e7fb7cf2e4cdcc81244b6cce3e0')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        go env -w GOPROXY=https://goproxy.cn,direct
    fi
    go build -o scripthaus cmd/main.go
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
}