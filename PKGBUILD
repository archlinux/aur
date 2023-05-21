# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Co-Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>
pkgname=vale
pkgver=2.26.0
pkgrel=1
pkgdesc="A customizable, syntax-aware linter for prose"
arch=('i686' 'x86_64')
url="https://github.com/errata-ai/vale"
license=('MIT')
makedepends=('go' 'go-bindata' 'rsync')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a54e5cce0b29e395a22a2476e42c52b2f2a9105caa9520ddf7b7cbf58fb3087b')

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
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/bin/vale" "${pkgdir}/usr/bin/vale"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/vale/README.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/vale/LICENSE"
}
