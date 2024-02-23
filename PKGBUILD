pkgname=mockgen
pkgver=0.4.0
pkgrel=1
pkgdesc='GoMock is a mocking framework for the Go programming language.'
arch=('x86_64')
url="https://github.com/uber-go/mock"
license=('Apache-2.0')
makedepends=('go')
source=("$url//archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('30f28caf179b14a3a4f0ed28135904728e1bf61d78ba5fc4b89a36e301dd621b')

prepare(){
  cd "mock-$pkgver"
  mkdir -p build/
}

build() {
  cd "mock-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
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
