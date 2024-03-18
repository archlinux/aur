# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=scripthaus-git
pkgver=0.5.1.r0.g03c4760
pkgrel=1
pkgdesc="ScriptHaus lets you run bash, Python, and JS snippets from your Markdown files directly from the command-line."
arch=('any')
url="https://www.scripthaus.dev/"
_ghurl="https://github.com/scripthaus-dev/scripthaus"
license=('MPL-2.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(
    'go>=1.17'
    'git'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export GOPROXY=https://goproxy.cn
    else
        echo "Your network is OK."
    fi
    go build -o scripthaus cmd/main.go
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/${pkgname%-git}" -t "${pkgdir}/usr/bin"
}