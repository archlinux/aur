# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=goenv
pkgver=3.1.5
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
license=(MIT)
arch=(x86_64 armv7h aarch64)
url="https://github.com/go-nv/goenv"
depends=(bash)
makedepends=(go)
checkdepends=(git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5d07fea064fd237b6a8ce1bfbc287af5f93f721c657643c205baacb2713788da')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    go mod download -modcacherw
    mkdir -p build/
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o build/goenv -ldflags "linkmode=external -X main.version=$pkgver" .
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 build/goenv -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

