# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=vale
pkgver=3.3.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('bfa2229e53180e58daee75f0206da9c69943c5c07f35465d023deeabb916b23b')

build() {
    cd ${pkgname}-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=${pkgver}" -o bin/vale ./cmd/vale
}

check() {
  cd ${pkgname}-${pkgver}
  go test ./cmd/vale
}

package() {
    cd ${pkgname}-${pkgver}
    install -vDm755 bin/vale  "${pkgdir}/usr/bin/vale"
    install -vDm644 README.md "${pkgdir}/usr/share/doc/vale/README.md"
    install -vDm644 LICENSE   "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
