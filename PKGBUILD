# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=go-sqlcmd
pkgver=1.4.0
pkgrel=1
pkgdesc="CLI for SQL Server and Azure SQL"
arch=("x86_64")
url="https://github.com/microsoft/go-sqlcmd"
license=('MIT')
depends=("glibc")
makedepends=("go")
replaces=("golang-sqlcmd")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('3822211016f6e584319194c087cadf798350826964890b432868fa02fc0ffdf1894b6bdcfbc7fe0ba75403f6c6cd8558b39e7d2c866dc082d734f8d58f76449d')
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
