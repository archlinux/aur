# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=4.5.1
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=(x86_64)
url=https://github.com/rusq/slackdump
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/rusq/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz)
b2sums=('e99aa98b21fb180fe60a62261487ef08955ab7ce7120ef7481d7451b6afa30598ed405a8e6b5a73f9fdb89721c2c29eaaaba311a193d672f9d4fee13cbb3836d')

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
