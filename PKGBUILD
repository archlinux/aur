# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tmuxpack <tmuxpack@users.noreply.github.com>

pkgname=tpack
pkgver=2.0.5
pkgrel=1
pkgdesc="Tmux Plugin Manager"
arch=(x86_64 aarch64)
url="https://github.com/tmuxpack/tpack"
license=(MIT)
makedepends=(go)
checkdepends=(git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7718defcdcc69911cfad9eb2b4b0d83b68effce39fb2470e75aa023655279f9e')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    sed -i 's/-race//g;' Makefile
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    VERSION="$pkgver" make build
}

check() {
    cd "$pkgname-$pkgver"
    make test-all
}

package() {
    depends=(tmux)
    cd "$pkgname-$pkgver"
    install -Dm755 dist/tpack -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md CLAUDE.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

