# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ddosify
pkgver=0.7.2
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/ddosify/ddosify"
license=('AGPL3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7dd5688c28cab22204fec704368df86a671e781c20969312735b3297dadc6ae7')

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
  go build -o build .
}

test() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
