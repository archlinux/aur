# Maintainer: Jan Kohnert <bughunter@jan-kohnert.de>
pkgname=helmify
pkgver=0.4.19
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
  "2b9a8acbdc3fb1d81bf02c79c0a17acd3ebc3b1959cb7b2ea56826083686fbfb42b6ac697ebba1dbc9447947fa97a7313bb1e76fbc1935388264de0e2814cbcc"
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
