# Maintainer: NAHFE

pkgname=logcli-git
_pkgname=logcli
pkgver=2.1.0.r1338.gd084dc7f4
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

pkgver() {
    cd ${srcdir}/loki
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/loki
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    sed -i -E "s/(go4\.org\/unsafe\/assume-no-moving-gc) v0\.0\.0-20201222180813-1025295fd063 (\/\/ indirect)/\1 v0.0.0-20211027215541-db492cf91b37 \2/" go.mod
    sed -i -E "s/(go4\.org\/unsafe\/assume-no-moving-gc) v0\.0\.0-20201222180813-1025295fd063 h1:1tk03FUNpulq2cuWpXZWj649rwJpk0d20rxWiopKRmc=/\1 v0.0.0-20211027215541-db492cf91b37 h1:Tx9kY6yUkLge\/pFG7IEMwDZy6CS2ajFc9TvQdPCW0uA=\\n\\1 v0.0.0-20211027215541-db492cf91b37\/go.mod h1:FftLjUGFEDu5k8lt0ddY+HcrH\/qU\/0qk+H8j9\/nTl3E=/" go.sum
    go build -o build ./cmd/logcli
}

check() {
    cd ${srcdir}/loki
    go test ./pkg/logcli/...
}

package() {
    install -Dm755 ${srcdir}/loki/build/logcli ${pkgdir}/usr/bin/logcli
}
