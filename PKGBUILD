# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=etr
pkgver=1.2.7
pkgrel=1
pkgdesc='ETR - ECMP Traceroute'
arch=('x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('git' 'go')
install=etr.install
source=("git+https://github.com/tkjaer/etr#tag=v${pkgver}")
sha512sums=('4c7b9f98ef610ebfba9934c7b7b521b12d3ca594f29305ef4fa9ffe84e1c739fc1a954b81a27d4a5fcc7ec418db6f321dd6972ee910b13083d7520096cf23b70')

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

