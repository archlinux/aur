# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=ffuf
pkgver=1.2.1
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ff474b21e192005a2df0f09f942b0370bdcb45d64ee35bd8782eb44a5c636e96')

build() {
    _commit=$(zcat $pkgname-$pkgver.tar.gz | git get-tar-commit-id)

    cd $pkgname-$pkgver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode=external
            -X main.version=$pkgver -X main.commit=$_commit" \
        -o $pkgname
}

check() {
    cd $pkgname-$pkgver
    go test ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
