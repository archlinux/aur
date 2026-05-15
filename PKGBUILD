# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
pkgname=helmify
pkgver=0.4.20
pkgrel=1
pkgdesc="Creates Helm chart from Kubernetes yaml"
arch=("x86_64")
url="https://github.com/arttor/helmify"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/arttor/helmify/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
  "1d54cc42d5ce329287da052e389cb2a6317416779a9c9cf10e67121500fe45d3b954d01dd63df33aac18166fe28be47e916358cb6f601738bb030f37f08cfaa9"
)

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "${pkgname}" ./cmd/...
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
