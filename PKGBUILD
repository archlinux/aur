# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
pkgname=helmify
pkgver=0.4.18
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
  "5b37ec3e92a4b98a33b2190fe417f3a12d7842d3951e589ad82707e3b21510d32bb5cfdf38b41f6a483eef184f5de74f48b803b1a004d906d1dcfd1ecf804243"
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
