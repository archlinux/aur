# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=etr
pkgver=1.3.0
pkgrel=2
pkgdesc='ETR - ECMP Traceroute'
arch=('x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('git' 'go')
install=etr.install
source=("git+https://github.com/tkjaer/etr#tag=v${pkgver}")
sha512sums=('645845c77c118bc090d6ec152d8f838e14d7d43268d1c8ef436523377bec95ed2934f12e8be1177aa84123e3368f177f8903ff70bf2d828380678a4d72bf8416')

prepare(){
  cd "$pkgname"
  mkdir -p build/
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./cmd/...
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

