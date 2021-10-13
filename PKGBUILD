# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=rootlesskit
pkgver=0.14.5
pkgrel=1
pkgdesc='Native "fake root" for implementing rootless containers.'
arch=('x86_64' 'aarch64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache 2.0')
makedepends=('go')
source=("https://github.com/rootless-containers/rootlesskit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9f36a4e871eb4ca3e521139f02bf8ef9d3249c9c6688558ada07ccc74a477d32')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

# Skip this check because it depends on bsd netcat which may conflict with an installed gnu netcat.
#check() {
#  cd "$pkgname-$pkgver"
#  go test ./...
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/rootlessctl "$pkgdir"/usr/bin/rootlessctl
  install -Dm755 build/rootlesskit "$pkgdir"/usr/bin/rootlesskit
  install -Dm755 build/rootlesskit-docker-proxy "$pkgdir"/usr/bin/rootlesskit-docker-proxy
}
