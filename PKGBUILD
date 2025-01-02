# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.8.2
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=(x86_64)
url=https://github.com/microsoft/go-sqlcmd
license=(MIT)
depends=(glibc)
makedepends=(go)
replaces=(golang-sqlcmd)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('6fb08f72accef33f3cc7edb4701371ce7305e6a52e9b69c258e0224b302ac5b5fc63d834f079567db2503ef6ad89d8d671f74d3c609766c5389224bb76e71a02')
options=(!lto)

prepare(){
    cd $pkgname-$pkgver
    mkdir -p build
}

build() {
    cd $pkgname-$pkgver
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o build/sqlcmd -ldflags="-linkmode=external -X main.version=${pkgver}" ./cmd/modern
}

package() {
    cd $pkgname-$pkgver
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 NOTICE.md "$pkgdir"/usr/share/licenses/$pkgname/NOTICE.md
    install -D -m755 build/sqlcmd "$pkgdir"/usr/bin/sqlcmd
}
