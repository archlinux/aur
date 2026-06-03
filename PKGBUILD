# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Elia Nitsche <nitscheelia at gmail dot com>
# Contributor: Mattéo Delabre <aur.matteo@delab.re>

pkgname=rmapi
pkgver=0.0.34
pkgrel=2
pkgdesc='Access reMarkable tablet files through the Cloud API'
arch=(x86_64 aarch64)
url='https://github.com/ddvk/rmapi'
license=(AGPL-3.0-or-later)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('42c96cdfe5bd9d19c13f01b18df12c685b9506e80c35e041f356e3dcc1265e65')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    mkdir -p build/
    sed -i "/Version/s/dev/$pkgver/" version/version.go
    go mod download -modcacherw
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build -o build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
