# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=rootlesskit
pkgver=0.14.1
pkgrel=1
pkgdesc='Native "fake root" for implementing rootless containers.'
arch=('x86_64')
url="https://github.com/rootless-containers/rootlesskit"
license=('Apache 2.0')
makedepends=('go')
source=("https://github.com/rootless-containers/rootlesskit/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('d6140c3c15dfe277f18c85ec8d3e7b98')

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
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
