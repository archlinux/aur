# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tmuxpack <tmuxpack@users.noreply.github.com>

pkgname=tpack
pkgver=2.0.0
pkgrel=1
pkgdesc="Tmux Plugin Manager"
arch=(x86_64 aarch64)
url="https://github.com/tmuxpack/tpack"
license=(MIT)
makedepends=(go)
checkdepends=(git)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e8783d5e4d6b3745bed716ebc57104adc3512f40510158d46ff80d98063a1d67')

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

