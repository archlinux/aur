# Maintainer: Leandro Guedes <leanguedes@icloud.com>

_pkgname=eqk
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.ga3dec55
pkgrel=1
pkgdesc="Earthquake Data Fetcher in Go"
arch=('x86_64')
url="https://github.com/mpinheir/eqk"
license=('MIT')
depends=(glibc)
makedepends=(git go)
source=("${_pkgname}::git+https://github.com/mpinheir/eqk")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    mkdir -p build
}

build() {
    cd "$_pkgname"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build .
}

package() {
    cd "$_pkgname"
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
