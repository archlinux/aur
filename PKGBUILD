pkgname=wasp
pkgver=3.0.1
pkgrel=1
pkgdesc='Distributed MQTT Broker, written in go.'
arch=('x86_64')
url="https://github.com/vx-labs/wasp/"
license=('GPL')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('89ed64235bd94aedfbdc54aa0c5817905b7e22203781234a64534a97d47fbefd')

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
  go build -o build -ldflags="-s -w -X main.BuiltVersion=v$pkgver" ./cmd/...
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
