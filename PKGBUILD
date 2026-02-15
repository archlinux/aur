# Maintainer: minus <minus@mnus.de>

pkgname=ktea
pkgver=0.7.0
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
sha256sums=('3c57e32ffd159975ddd745476966dd8e1d65450d309efc46f7f5ef3a8c38fc37')

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

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
