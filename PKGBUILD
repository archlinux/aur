# Maintainer: Johannes Loher <johannes.loher@fg4f.de>

pkgname=fence
pkgver=0.1.54
pkgrel=1
pkgdesc="Lightweight, container-free sandbox for running untrusted commands"
arch=('x86_64')
url="https://github.com/Use-Tusk/fence"
license=('Apache-2.0')
depends=('bubblewrap' 'socat')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Use-Tusk/fence/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5bb6064189e154e3223c3afb28cc12d28aae88f7f6efbd4c1b87d2452df5c16c')

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
    go build -ldflags "-s -w -X main.version=$pkgver" -o "$pkgname" ./cmd/fence
}

check() {
    cd "$pkgname-$pkgver"
    go test $(go list ./... | grep -v /internal/configschema)
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
