pkgname=wasp
pkgver=1.1.0
pkgrel=1
pkgdesc='Distributed MQTT Broker, written in go.'
arch=('x86_64')
url="https://github.com/vx-labs/wasp/"
license=('GPL')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('343e858bd6a79553493b79e33208dd71fb2d8f06583cc372ef3c29d2a93f03cb')

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
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/waspctl "$pkgdir"/usr/bin/waspctl
}
