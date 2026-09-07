# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Fantix King <fantix.king@gmail.com>

pkgname=granted
pkgver=0.39.0
pkgrel=1
pkgdesc="CLI tool that simplifies access to cloud roles in your web browser"
arch=(x86_64 i686 aarch64)
url="https://github.com/fwdcloudsec/granted"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6f9a4b38ffac2da32d7f6c5d225aca2f799d1f74aadd3783a873ff5d98b94144')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o granted ./cmd/granted/main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 granted scripts/assume -t "$pkgdir/usr/bin/"
    ln -sf /usr/bin/granted "$pkgdir/usr/bin/assumego"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
