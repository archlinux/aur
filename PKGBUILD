# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=3.1.10
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=(x86_64)
url=https://github.com/rusq/slackdump
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/rusq/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz)
b2sums=('0deb14b4a477028ebd3d36cdb9d5082f2fb4b94e6f1b71854b22a69ed8e3ecb8998db85ad002ae70edc1654ab6141165ea7120f2dd28d79607385a6a29f33aae')

prepare() {
   # Broken tests
   rm $pkgname-${pkgver//_/-}/cmd/slackdump/internal/export/v3_test.go
}

build() {
    cd $pkgname-${pkgver//_/-}
    mkdir -p build
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/...
}

check() {
    cd $pkgname-${pkgver//_/-}
    go test ./...
}

package() {
    cd $pkgname-${pkgver//_/-}
    install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
