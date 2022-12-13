# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=ddosify
pkgver=0.9.1
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/ddosify/ddosify"
license=('AGPL3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d969ea479e9ef308f2c75d23e134833ea02b982796905d538af38cbeb8b8cad9')

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
  go build -o build .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
