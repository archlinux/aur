# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=ddosify
pkgname=anteon
pkgver=2.6.0
pkgrel=2
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/getanteon/anteon"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/selfhosted-$pkgver.tar.gz")
sha256sums=('228b2acc455e00866fbaf8dded3c3471da995385c5841390ea6010017195ee57')

prepare(){
  cd "$pkgname-selfhosted-$pkgver/ddosify_engine/"
  mkdir -p build/
  export GOPATH="${srcdir}"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-selfhosted-$pkgver/ddosify_engine/"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

# check() {
#   cd "$pkgname-selfhosted-$pkgver/ddosify_engine/"
#   go test ./...
# }

package() {
  cd "$pkgname-selfhosted-$pkgver/ddosify_engine/"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
