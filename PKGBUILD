# Maintainer: Johannes Loher <johannes.loher@fg4f.de>

pkgname=fence
pkgver=0.1.67
pkgrel=1
pkgdesc="Lightweight, container-free sandbox for running untrusted commands"
arch=('x86_64')
url="https://github.com/fencesandbox/fence"
license=('Apache-2.0')
depends=('bubblewrap' 'socat')
optdepends=('bpftrace: filesystem violation visibility when monitoring with -m')
makedepends=('go')
checkdepends=('socat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fencesandbox/fence/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f2e55bd108816d224f45b3115e0c8feba2cb1a92055f0ebf7839f82b87a84f35')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o "$pkgname" ./cmd/fence
}

check() {
    cd "$pkgname-$pkgver"
    # -trimpath (set for the build) breaks configschema's runtime.Caller-based
    # fixture lookup; it only matters for shipped binaries, so disable it here.
    go test -trimpath=false ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
