# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=jrp
pkgver=1.2.0
pkgrel=1
pkgdesc='JSON formatter that lays out a document by the shape of the data'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/json-really-pretty-cli'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba451297e956745a88194df7d351aae346455e1fbd2bbfb768606b592d7c8415')

# The module cache stays inside $srcdir, so the build leaves nothing in ~/go
_goenv() {
    export GOPATH="$srcdir/gopath"
    export GOFLAGS='-mod=readonly -modcacherw'
}

prepare() {
    cd "json-really-pretty-cli-$pkgver"
    _goenv
    # The formatting engine is a module of its own; fetched here, build() and check() need no network
    go mod download
}

build() {
    cd "json-really-pretty-cli-$pkgver"
    _goenv
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="$GOFLAGS -buildmode=pie -trimpath"
    # -ldflags given here replaces any in GOFLAGS, so -linkmode=external has to be repeated
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o jrp .
}

check() {
    cd "json-really-pretty-cli-$pkgver"
    _goenv
    go test ./...
}

package() {
    cd "json-really-pretty-cli-$pkgver"
    install -Dm755 jrp -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
