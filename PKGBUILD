# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=vale
pkgver=3.2.1
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9a4390b80503a67601e62f1736d6f91e5c2406e9abfa337c1d3cc154e7b3dc76')

build() {
    cd ${pkgname}-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=${pkgver}" -o bin/vale ./cmd/vale
}

package() {
    cd ${pkgname}-${pkgver}
    install -vDm755 bin/vale  "${pkgdir}/usr/bin/vale"
    install -vDm644 README.md "${pkgdir}/usr/share/doc/vale/README.md"
    install -vDm644 LICENSE   "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
