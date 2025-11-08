# Maintainer: minus <minus@mnus.de>

pkgname=ktea
pkgver=0.6.1
pkgrel=1
pkgdesc="Kafka TUI client "
arch=('x86_64')
url="https://github.com/jonas-grgt/ktea"
license=('Apache-2.0')
makedepends=(
  'go'
)
source=(
  "https://github.com/jonas-grgt/ktea/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  'c8d6c83c62da685754d94fb3e6c5fc59c540eb30e865a0a22e02ecb44233d21e'
)

prepare() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  
  go build ./cmd/ktea
}

check() {
  cd "${pkgname}-${pkgver}"
  go test -count=1 ./...  -p 1
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
