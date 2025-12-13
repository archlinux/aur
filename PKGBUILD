# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=etr
pkgver=0.0.10
pkgrel=1
pkgdesc='ETR - ECMP Traceroute'
arch=('x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('git' 'go')
install=etr.install
source=("git+https://github.com/tkjaer/etr#tag=v${pkgver}")
sha512sums=('2a3c85ed8f330b1c8b0dcf5861990e2f6f3053063d668f2868b55d96b5fb74a5d0413aa9b7e57aaa3e96a06982bb7f216dfa0b4a7052f023a9b18972c28db1d8')

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

