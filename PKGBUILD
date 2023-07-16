# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dstp
pkgver=0.4.0
pkgrel=1
pkgdesc="Run common networking tests against your site"
arch=('any')
url="https://github.com/ycd/dstp"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64cdaf45206ce2d6e36a56314cc759073dedf9cfcc040800d75bdd896f49fe79')

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
