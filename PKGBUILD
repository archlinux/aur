# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.9.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=(x86_64)
url=https://github.com/microsoft/go-sqlcmd
license=(MIT)
depends=(glibc)
makedepends=(go)
replaces=(golang-sqlcmd)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('eae447baa5a63303fbfe17eedb00181c1e654159a1a1c64dfd36fec655871cb784315408b1149dd24e208edce9b6594ec2b709116cf85e46f4e11cf6d0cbb840')
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
