# Maintainer: Alexander Beck <dev@daallexx.eu>

pkgname=etr
pkgver=1.0.2
pkgrel=1
pkgdesc='ETR - ECMP Traceroute'
arch=('x86_64')
url='https://github.com/tkjaer/etr'
license=('MIT')
depends=('libpcap')
makedepends=('git' 'go')
install=etr.install
source=("git+https://github.com/tkjaer/etr#tag=v${pkgver}")
sha512sums=('008df84988314bec0d6761a7c272c164e7ea45aa4fb8679db0451927d9101d5f7e7cbbeb9d29952e9b98fa779e3d705084f8adbb6f8cc2ccdc93bab63fd98b5f')

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

