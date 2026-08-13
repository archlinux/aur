# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui
pkgver=1.5.2
pkgrel=1
pkgdesc='An interactive web UI for gRPC, along the lines of postman'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/fullstorydev/grpcui"
license=('MIT')
makedepends=('go')
source=("https://github.com/fullstorydev/grpcui/archive/v$pkgver.tar.gz")
sha256sums=('43e127082396b1ea11f4687a6f69555579b34501538e7ca361c9db35e486139d')

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
  go build \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X=main.version=v$pkgver" \
    -o build ./cmd/$pkgname
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
