# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=lazyssh
pkgver=0.3.0
pkgrel=1
pkgdesc='A terminal-based SSH manager inspired by lazydocker and k9s'
arch=('x86_64' 'aarch64')
url='https://github.com/Adembc/lazyssh'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('36cd630b3cd9447e88904171cbb64944aeacbbd62c15db66d8a0e4a4486ffe88')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build/$pkgname -ldflags "-X main.version=$pkgver" ./cmd/
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install license if it exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
