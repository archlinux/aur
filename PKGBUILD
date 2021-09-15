# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=dockle
pkgver=0.4.2
pkgrel=1
pkgdesc="Container Image Linter for Security, Helping build the Best-Practice Docker Image"
arch=('any')
url="https://github.com/goodwithtech/dockle"
license=('Apache')
makedepends=('go' 'git' 'btrfs-progs')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90e23e79965dc3da5f9f587f9b150c16f00c6e65ba4cdf848a3077ca2a1854b1')

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

test() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
