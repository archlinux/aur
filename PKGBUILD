# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=("x86_64")
url="https://github.com/microsoft/go-sqlcmd"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bb78bfc66c4b729acd51fdfd05431adeb831ff1d1afeafd2c87c9acb20a45592fa276a3c2a81c8be7f230086f7fcf9916e99a52f4672ae31006c23dd7b47c2e1')
validpgpkeys=()

prepare(){
    cd "${pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o build/sqlcmd -ldflags="-linkmode=external -X main.version=${pkgver}" ./cmd/modern
}

package() {
    cd "${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE.md "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
    install -D -m755 build/sqlcmd "${pkgdir}/usr/bin/sqlcmd"
}
