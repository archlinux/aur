# Maintainer: Douglas de Moura <douglas@demoura.dev>

pkgname=chroncal
pkgver=0.2.3
pkgrel=1
pkgdesc='Terminal-first calendar, todo, and journal manager'
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'i686')
url='https://github.com/DouglasdeMoura/chroncal'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91d8eca7476294423333a786a43b0326b0655d70bc451f48fe8539c3be7de77b')

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-s -w -X main.version=${pkgver} -X main.commit=archive -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    -o chroncal \
    ./cmd/chroncal
}

check() {
  cd "${pkgname}-${pkgver}"

  export CGO_ENABLED=0
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 chroncal "${pkgdir}/usr/bin/chroncal"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
