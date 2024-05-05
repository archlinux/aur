# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=ddosify
pkgname=anteon
pkgver=1.0.6
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/getanteon/anteon"
license=('AGPL3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99b24969392d0e3e84ec8ae5bea73cf5b0951a2161d387d492a3788aef0d8370')

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

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
