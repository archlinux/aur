# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=slackdump
pkgver=2.5.9
pkgrel=1
pkgdesc='Save your private and public slack messages, threads, files, and users locally'
arch=(x86_64)
url=https://github.com/rusq/slackdump
license=(GPL-3.0-only)
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/rusq/$pkgname/archive/refs/tags/v${pkgver//_/-}.tar.gz)
b2sums=('ea8be5807edfc7e956716e85b09dfa8f39b5655393ab2b4ac45c9174e906ff83abe1745d9baa3618f25170bfcc22ebe8684456bb2922868097aabd58cd55b35b')

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
