# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: ka2n <ka2n@pobox.com>

pkgname=miru-go
pkgver=0.0.22
pkgrel=1
pkgdesc='A command-line tool for viewing package documentation with a man-like interface'
url='https://github.com/ka2n/miru'
arch=('aarch64' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('github-cli' 'glab')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6ec57ea7953e5928d4ff247043b2ef8fb0539fb52909e090b66816436ce785a4')

prepare() {
    cd "miru-$pkgver"
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

    cd "miru-$pkgver"
    go build -o build ./cmd/...
}

check() {
    cd "miru-$pkgver"
    go test ./...
}

package() {
    cd "miru-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" build/miru
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" README.md CREDITS
}

