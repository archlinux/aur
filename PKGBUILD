# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=qsd77
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI bridge for Utumno"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/qsd77"
license=('MIT')
depends=('glibc' 'quickshell')
makedepends=('go')
optdepends=(
  'utumno: the default shell qsd77 talks to'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('27ec3c221e30b8f426978b047a8b694c0476901ba564a979890b91e5daada0c8')

prepare() {
    cd "$pkgname-$pkgver"
    # Unlike the Void template (go get cobra@latest), build against the
    # versions pinned in go.sum.
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o qsd77 .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 qsd77 "$pkgdir/usr/bin/qsd77"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
