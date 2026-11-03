# Maintainer: taotieren <admin@taotieren.com>

pkgname=mothx-git
pkgver=1.3.108.pre.1.r7.gb433fe0
pkgrel=1
pkgdesc="🚀 One Binary to Rule Them All — Your AI Coding Assistant in the Terminal"
arch=($CARCH)
url="https://github.com/oschina/mothx"
license=('MIT')
provides=(${pkgname%-git} vibecoding)
conflicts=(${pkgname%-git} vibecoding)
#replaces=(${pkgname})
depends=(
    sh
    bubblewrap
)
makedepends=(
    git
    go
    npm
    nodejs
)
optdepends=()
backup=()
options=('!debug')
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^[vV]//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.cn,direct

    # mkdir -pv build/
    # go build -o build/${pkgname%-git} ./cmd/mothx
    make ui-install
    make ui-build
    make build
}

package() {
    cd "${srcdir}/${pkgname}"

    install -vDm755 bin/${pkgname%-git} -t ${pkgdir}/usr/bin/
    install -vDm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm0644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -sf /usr/bin/${pkgname%-git} ${pkgdir}/usr/bin/vibecoding
}
