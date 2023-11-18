# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.5.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=("x86_64")
url="https://github.com/microsoft/go-sqlcmd"
license=('MIT')
depends=("glibc")
makedepends=("go")
replaces=("golang-sqlcmd")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0b51e495c8cfb000556a693cc5ba130b3d3fc25593e91e1d536880f4e3545551d7162c4a03ba13a7057bcb22a61667e036b1faeafe10589c10ea8e4fcac8d4be')
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
