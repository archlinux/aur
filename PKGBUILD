# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scripthaus
pkgver=0.5.1
pkgrel=3
pkgdesc="ScriptHaus lets you run bash, Python, and JS snippets from your Markdown files directly from the command-line."
arch=('any')
url="https://www.scripthaus.dev/"
_ghurl="https://github.com/scripthaus-dev/scripthaus"
license=('MPL-2.0')
conflicts=("${pkgname}")
depends=()
makedepends=(
    'go'
    'git'
    'curl'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('c4b265d35ffed0fd380ce0c0868ce9e51de57eb4bcb307d86f9d23c4e2ef20e4')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
    go build -o scripthaus cmd/main.go
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/"*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}