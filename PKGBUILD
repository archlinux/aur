# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=goenv-git
pkgver=3.1.1.r0.g6de0c925
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/go-nv/goenv"
depends=('bash')
makedepends=('git' 'go')
provides=('goenv')
conflicts=('goenv')
source=("$pkgname::git+$url#branch=main") # latest release on main
sha256sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
    cd "$pkgname"
    export GOPATH="$srcdir/gopath"
    go mod download -modcacherw
    mkdir -p build/
}

build() {
    cd "$pkgname"

    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o build/goenv -ldflags "linkmode=external -X main.version=$pkgver" .
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 build/goenv -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

