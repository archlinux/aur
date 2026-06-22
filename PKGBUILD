# Maintainer: Johannes Loher <johannes.loher@fg4f.de>

pkgname=fence
pkgver=0.1.61
pkgrel=1
pkgdesc="Lightweight, container-free sandbox for running untrusted commands"
arch=('x86_64')
url="https://github.com/Use-Tusk/fence"
license=('Apache-2.0')
depends=('bubblewrap' 'socat')
optdepends=('bpftrace: filesystem violation visibility when monitoring with -m')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Use-Tusk/fence/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4df2107171de9c420252c5fc9876887238b49d46fa474fdc1e15522b4036a949')

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
    go build -ldflags "-linkmode=external -s -w -X main.version=$pkgver" -o "$pkgname" ./cmd/fence
}

check() {
    cd "$pkgname-$pkgver"
    go test -skip 'TestLinux_CtrlZ' $(go list ./... | grep -v /internal/configschema)
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
