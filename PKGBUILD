# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=ddosify
pkgname=anteon
pkgver=1.7.2
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/getanteon/anteon"
license=('AGPL3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/selfhosted-$pkgver.tar.gz")
sha256sums=('99081e2f8761d664e131eeeaafd98e30091d3ff5f1599ec566faef1b92824a47')

prepare(){
  cd "$pkgname-selfhosted-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-selfhosted-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-selfhosted-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-selfhosted-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
