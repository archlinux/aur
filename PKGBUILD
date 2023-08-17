# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.3.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=("x86_64")
url="https://github.com/microsoft/go-sqlcmd"
license=('MIT')
depends=("glibc")
makedepends=("go")
replaces=("golang-sqlcmd")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('02c8bda11e03e0b763b42ab70ab8bfb9eea58fb9939ab2e4db71f52ac6088ac7efc7502032e4484e1269b66346f6a7d2b564d91082183a54fab927c29fadf6d2')
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
