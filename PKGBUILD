# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=rootlesskit
pkgver=0.14.4
pkgrel=1
pkgdesc='Native "fake root" for implementing rootless containers.'
arch=('x86_64' 'aarch64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache 2.0')
makedepends=('go')
source=("https://github.com/rootless-containers/rootlesskit/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8fa09224206ea7b0c63aa67a9d4bdf449df32451cbd7c5e6e80e6cf02846d2a8')
checkdepends=('netcat')

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
