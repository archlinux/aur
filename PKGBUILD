# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=etr
pkgver=1.1.3
pkgrel=1
pkgdesc='ETR - ECMP Traceroute'
arch=('x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('git' 'go')
install=etr.install
source=("git+https://github.com/tkjaer/etr#tag=v${pkgver}")
sha512sums=('d697f7abf4f2045cd60496bd2bf62172cf0b36d2a2620d20b82a04f481c376edbbe787b455368accf6b535d7e804192a44869a505f557d0ab04d46d127f4f523')

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

