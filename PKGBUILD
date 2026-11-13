# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli
pkgver=0.34.1
pkgrel=1
pkgdesc='CLI component for Pomerium'
arch=(x86_64 armv6h armv7h aarch64)
url="https://github.com/pomerium/cli"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('10c71e688c8a9d6defc4eb33803f08d19ac8879ec046828ed4ad513db646e8c7')

prepare() {
    cd "cli-$pkgver"
    mkdir -p build
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    cd "cli-$pkgver"
    local _PKG="${url#https://}"
    go build \
        -o build \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"
            -X $_PKG/version.ProjectName=$pkgname -X $_PKG/version.ProjectURL=$_PKG" \
            "./cmd/$pkgname"
}

check() {
    cd "cli-$pkgver"
    go test \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        ./...
}

package() {
    cd "cli-$pkgver"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
