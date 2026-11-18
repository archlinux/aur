# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=pit
pkgver=2.10.0
pkgrel=1
pkgdesc='Work with a directory tree of several git repositories as if it were one'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/pit'
license=('MIT')
depends=('git')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e29d5c2edcd3c7b7c69ed2aee861a6132f5c5471f655d6f698f643f30a220085')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
    # -ldflags given here replaces any in GOFLAGS, so -linkmode=external has to be repeated
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o pit ./cmd/pit
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 pit -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
