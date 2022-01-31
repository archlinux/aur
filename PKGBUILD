# Maintainer: M. Efe Çetin <efectn@protonmail.com>

pkgname=fiber-cli
pkgver=0.0.9
pkgrel=2
pkgdesc="Fiber Command Line Interface "
arch=('any')
url="https://github.com/gofiber/cli"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('727b26230584908affc45d2fb94e5786fd749f558e98cf956c1238bf18e4d73e')

prepare() {
    cd "cli-${pkgver}"

    mkdir build
    go mod download
}

build() {
    cd "cli-${pkgver}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build -v \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
        -o build \
        ./fiber
}

check() {
    cd "cli-${pkgver}"

    go test -v ./...
}

package() {
    cd "cli-${pkgver}"

    install -Dm755 build/fiber "$pkgdir/usr/bin/fiber"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}