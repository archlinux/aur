# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=syg_go
pkgver=0.2.1
pkgrel=1
pkgdesc='Yggdrasil address miner written in Go'

url="https://github.com/tdemin/syg_go"
arch=(any)
license=(LGPL3)
makedepends=(go)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('34f615a5c5a34b9c526b7d6766f9039aafd00a051084619d97a425ed08c9d0b6')

_dir="${pkgname}-${pkgver}"

build () {
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="${SRCDEST}/go-modules"

    cd "${srcdir}/${_dir}"
    go build -ldflags="-linkmode=external -X main.version=v$pkgver" .
}

check () {
    cd "${srcdir}/${_dir}"
    go test ./...
}

package () {
    install -p -m 755 -D -t "$pkgdir/usr/bin/" "${srcdir}/${_dir}/${pkgname}"
    install -m 644 -D -t "$pkgdir/usr/share/doc/$pkgname/" "${srcdir}/${_dir}/README.md"
}
