# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli
pkgver=0.31.0
pkgrel=1
pkgdesc='CLI component for Pomerium'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pomerium/cli"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ad928bb7f18bc92ad2c2a95ee23ad3102fbcde9a6d62833455764b58350d3bc5')

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
    install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
}
