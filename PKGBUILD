# Based on work of neossh maintainer: Andy Kelk <andy@andykelk.net>
# Maintainer: Leonardo Amaral <archlinux@leonardoamaral.com.br>

pkgname=neossh
pkgver=1.0.0
pkgrel=1
pkgdesc='An actively maintained fork and continuation of lazyssh'
arch=('x86_64' 'aarch64')
url='https://github.com/WhiteRoseLK/neossh'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d96bef14e3269c33c59cc28b942a94bb0471e45a8752d5c853dae734f3a969d')

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
