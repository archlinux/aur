# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=golazo
pkgver=0.26.0
pkgrel=1
pkgdesc="A minimalist TUI for following football / soccer matches in real-time"
arch=(x86_64 aarch64)
url='https://github.com/0xjuanma/golazo'
license=(Apache-2.0)
depends=(glibc)
optdepends=('libnotify: notifications support')
makedepends=(go)
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        001-disable-update.patch)
sha256sums=('6b06c5b8dd5985c890630389517564c241b585d56c6728de32cbf6b8c287f524'
            '2b18a5064d3aef73e5992f4b1490346e2cbdf95eca3a7fa2f3f65d1bc514d86c')

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname-$pkgver"
    ## remove update functionality; use the AUR to update
    patch -p1 < "$srcdir/001-disable-update.patch"
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o golazo -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X github.com/0xjuanma/golazo/cmd.Version=${pkgver}"
}

# check() {
#     cd "$pkgname-$pkgver"
#     go test ./... -skip "./cmd/" -failfast
# }

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 golazo -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

