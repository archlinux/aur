# Maintainer: minus <minus@mnus.de>

pkgname=jsonsum-go
pkgver=0.1.0
pkgrel=1
pkgdesc="Tool for streamable hashing for JSON"
arch=('x86_64')
url="https://github.com/jsonsum/jsonsum-go"
license=('MIT')
makedepends=('go')
source=("https://github.com/jsonsum/jsonsum-go/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e7b6df4fcdc303d5548cd4648f3c8b669553c1cffa433a413e7c5b83cf41dc6')

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
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/jsonsum "$pkgdir"/usr/bin/jsonsum
}
