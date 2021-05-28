# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=rootlesskit
pkgver=0.14.2
pkgrel=1
pkgdesc='Native "fake root" for implementing rootless containers.'
arch=('x86_64' 'aarch64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache 2.0')
makedepends=('go')
source=("https://github.com/rootless-containers/rootlesskit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7c5ee94af852c65116ae480714751ada3ba9cbb68c3ee7d01a76f644498b852')

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

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/rootlessctl "$pkgdir"/usr/bin/rootlessctl
  install -Dm755 build/rootlesskit "$pkgdir"/usr/bin/rootlesskit
  install -Dm755 build/rootlesskit-docker-proxy "$pkgdir"/usr/bin/rootlesskit-docker-proxy
}
