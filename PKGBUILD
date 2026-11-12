# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=ddosify
pkgname=anteon
pkgver=2.4.0
pkgrel=1
epoch=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/getanteon/anteon"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca0c1b8447bd2e2359697becb337767a50ed493f9e85d6fcfdd524fd85b579b4')

prepare(){
  cd "$pkgname-$pkgver/ddosify_engine/"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver/ddosify_engine/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

# check() {
#   cd "$pkgname-$pkgver/ddosify_engine/"
#   go test ./...
# }

package() {
  cd "$pkgname-$pkgver/ddosify_engine/"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
