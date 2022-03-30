# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=hut
pkgver=0.1.0
pkgrel=1
pkgdesc='A CLI tool for sr.ht (sourcehut)'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~emersion/hut'
license=('AGPL3')
makedepends=('go' 'scdoc')
source=("https://git.sr.ht/~emersion/${pkgname}/refs/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('0b1ec695fa670f5df9594e4fdfc51b2e62f16797c5ef9ab27283310badd6f065'
            'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')


check() {
    cd "$srcdir/$pkgname-$pkgver"
    go test ./...
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make -e
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR=$pkgdir install
}
