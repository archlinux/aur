# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli
pkgver=4.22.1
pkgrel=2
pkgdesc="Efficient creation and management of applications on Azion Edge Platform"
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/aziontech/azion"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a96d6f3387438fcc7ce9ad634aacbe0d40b0247a117f53c163e1371521d10a7f')

prepare() {
    export GOPATH="$srcdir"
    cd "azion-$pkgver"
    # sed -i "/BIN_VERSION/c\ BIN_VERSION=${pkgver}" Makefile
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "azion-$pkgver"
    make build
}

# check() {
#     cd "azion-$pkgver"
#     go test ./...
# }

package() {
    cd "azion-$pkgver"
    install -Dm755 bin/azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md SUPPORT.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
