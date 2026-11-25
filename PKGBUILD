# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.11.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=(x86_64)
url=https://github.com/microsoft/go-sqlcmd
license=(MIT)
depends=(glibc)
makedepends=(go)
replaces=(golang-sqlcmd)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('cfb578ab43019e31927caca6aaeac9b2e7fb312cc05a9e740fad4557a7743810ecb6a598add578e4d1dfaa05d0fd8d6cbea82aeaa4017500d7c20ae86d53004f')
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
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build/sqlcmd ./cmd/modern
}

check() {
    cd $pkgname-$pkgver
    go test ./cmd/modern
}

package() {
    cd $pkgname-$pkgver
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 NOTICE.md "$pkgdir"/usr/share/licenses/$pkgname/NOTICE.md
    install -D -m755 build/sqlcmd "$pkgdir"/usr/bin/sqlcmd
}
