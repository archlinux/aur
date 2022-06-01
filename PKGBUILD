# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=ffuf
pkgver=1.5.0
pkgrel=1
pkgdesc="Fast web fuzzer written in Go"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ffuf/ffuf"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('70dc411c014c826f9c8a7b021e01d5bc50e2cba17e0dcc4df3e2e2574ad12073')

build() {
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
            -X github.com/ffuf/ffuf/pkg/ffuf.VERSION_APPENDIX= " \
        -o $pkgname
}

check() {
    cd $pkgname-$pkgver
    go test ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
