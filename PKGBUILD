# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=1.2.1
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1b4cebc76127d1557cf63a1aa8493506d434321bb55e2b09e65d4f88b8c5707e')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    mkdir -p build
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o "build/$pkgname" -ldflags "-linkmode=external -X main.version=$pkgver" ./cmd
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "build/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
