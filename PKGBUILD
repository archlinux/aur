# Maintainer: NAHFE

pkgname=logcli-git
_pkgname=logcli
pkgver=1
pkgrel=1
pkgdesc="LogCLI allows users to run LogQL queries against a Loki server"
arch=('x86_64')
depends=("glibc")
makedepends=("go" "git")
provides=("logcli")
url="https://github.com/grafana/loki"
license=('AGPL')
source=("loki::git+https://github.com/grafana/loki.git")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/loki
    mkdir -p build/
}

build() {
    cd ${srcdir}/loki
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build ./cmd/logcli
}

check() {
    cd ${srcdir}/loki
    go test ./pkg/logcli/...
}

package() {
    install -Dm755 ${srcdir}/loki/build/logcli ${pkgdir}/usr/bin/logcli
}
