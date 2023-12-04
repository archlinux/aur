# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=vale
pkgver=2.29.7
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('278d8d49cf42740c38c10254012bbaad01fcf1c628aa69c51c02788d1495885f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOPATH="${srcdir}/gopath"
    export PATH="${srcdir}/gopath/bin:$PATH"

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-s -w -X main.version=\"${pkgver}\" -linkmode external -extldflags \"${LDFLAGS}\"" \
      -o bin/vale ./cmd/vale
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bin/vale "${pkgdir}/usr/bin/vale"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vale/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
