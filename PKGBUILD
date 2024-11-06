# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=mockgen
pkgver=0.5.0
pkgrel=1
pkgdesc='GoMock is a mocking framework for the Go programming language.'
arch=('x86_64')
url="https://github.com/uber-go/mock"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go>1.20')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41c16668926118ccfe8606e335487c0213efbb1330061e3ab7e97650b78e7737')

prepare(){
  cd "mock-$pkgver"
  mkdir -p build/
}

build() {
  cd "mock-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,shstk"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "mock-$pkgver"
  GOROOT=/usr/lib/go go test ./...
}

package() {
  cd "mock-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
