# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=go-yq
pkgver=3.4.0
pkgrel=1
pkgdesc='portable command-line YAML processor'
arch=(x86_64)
url=https://github.com/mikefarah/yq
license=(MIT)
makedepends=(go)
conflicts=(yq)
source=(https://github.com/mikefarah/yq/archive/${pkgver}.tar.gz)
sha256sums=('76b96cd2ba503eef396d8773d874b4fdc56fc3aff3c61b0808afadff2a6daae7')

prepare() {
  cd yq-$pkgver
  go mod vendor
}

check() {
  cd yq-$pkgver
  go test ./...
}

build() {
  cd yq-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o yq
}

package() {
  cd yq-$pkgver
  install -Dm755 yq "$pkgdir/usr/bin/yq"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
