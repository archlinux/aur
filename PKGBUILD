# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=golang-sqlcmd
_pkgname=go-sqlcmd
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=("x86_64")
url="https://github.com/microsoft/go-sqlcmd"
license=('MIT')
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('61be6c0722f2ba85d2ceb6e61f83b629aa556a96a6c9de00f2b9b3f87842f398189020018dfbaf0af55f8337d4bfccb764858d9c15dc9a617685703c8a27fcf9')
validpgpkeys=()

prepare(){
    cd "${_pkgname}-${pkgver}"
    mkdir -p build
}

build() {
    cd "${_pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o build/sqlcmd -ldflags="-linkmode=external -X main.version=${pkgver}" ./cmd/modern
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 NOTICE.md "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.md"
    install -D -m755 build/sqlcmd "${pkgdir}/usr/bin/sqlcmd"
}
