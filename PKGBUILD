# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mikołaj Badyl <contact@octrafic.com>

pkgname=octrafic
_pkgname=octrafic-cli
pkgver=0.3.4
pkgrel=1
pkgdesc='AI-powered CLI tool for API testing and exploration'
url='https://github.com/octrafic/octrafic-cli'
arch=('aarch64' 'armv7h' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c81dd8828491f1840d9f76af24606b02a7b3d1038a64465010ed4f07a9f19a8')

prepare() {
    cd "$_pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$_pkgname-$pkgver"
    go build -o build ./...
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

