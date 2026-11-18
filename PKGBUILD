# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=func-e
pkgver=1.6.0
pkgrel=1
pkgdesc='Download and run Envoy proxy versions'
arch=('x86_64' 'aarch64')
url='https://github.com/tetratelabs/func-e'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
conflicts=('func-e-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98982018669fe59b2216d43cafac3760bbad346cec93b329d8943f56268b6446')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath" GOFLAGS='-mod=readonly -modcacherw'
    go mod download
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
    # -buildvcs=false: srcdir sits inside the AUR/packaging git checkout, not upstream's repo
    export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw'
    go build -ldflags "-linkmode=external -X main.version=$pkgver" -o func-e ./cmd/func-e
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 func-e "$pkgdir/usr/bin/func-e"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md USAGE.md
}
