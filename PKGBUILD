# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dockle
pkgver=0.4.15
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image"
arch=('any')
url="https://github.com/goodwithtech/dockle"
license=('Apache')
makedepends=('go' 'git' 'btrfs-progs')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d0c1013b8c618ec47fd766303ba6b975b118902a52d352484852206b7fdf2c40')

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
  go build -o build ./cmd/${pkgname}
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
