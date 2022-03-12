# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dstp
pkgver=0.3.1
pkgrel=1
pkgdesc="Run common networking tests against your site"
arch=('any')
url="https://github.com/ycd/dstp"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ae7b71301ad755012e7e9d3996b341a8f25741509399ec9bb58cc27fa8e0e076')

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
  go build -o build cmd/dstp/main.go
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/main "$pkgdir"/usr/bin/$pkgname
}
