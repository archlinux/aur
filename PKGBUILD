# Maintainer: taotieren <admin@taotieren.com>

pkgname=turbo-attack-git
pkgver=0.1.0.2.g7fc82bb
pkgrel=1
pkgdesc="A turbo traffic generator pentesting tool to generate random traffic with random mac and ip addresses in addition to random sequence numbers to a particular ip and port."
arch=($CARCH)
url="https://github.com/mytechnotalent/turbo-attack"
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
#replaces=(${pkgname})
depends=(glibc
    sudo)
optdepends=("turbo-scanner: A port scanner and service detection tool that uses 1000 goroutines at once to scan any hosts's ip or fqdn with the sole purpose of testing your own network to ensure there are no malicious services running.")
makedepends=(git
    go)
checkdepends=()
backup=()
options=()
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --always | sed 's/^v//;s/-/./g'
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

    mkdir -pv build/
    go build -o build
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     go test -v -cover ./...
#     go test -coverprofile=coverage.out ./...
#     go tool cover -html=coverage.out
# }

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 build/${pkgname%-git} -t ${pkgdir}/usr/bin/
}
