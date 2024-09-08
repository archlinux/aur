# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=tetrigo
pkgver=0.1.6
pkgrel=2
pkgdesc='Play Tetris in your terminal.'
arch=('x86_64')
url="https://github.com/Broderick-Westrope/tetrigo"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15b3bc14055ec208d3f5b241719faa6517f60e5421dd16690c6bf98860ab02d1')

prepare(){
  cd "tetrigo-$pkgver"
  mkdir -p build/
}

build() {
  cd "tetrigo-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS} -Wl,-z,shstk"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

check() {
  cd "tetrigo-$pkgver"
  GOROOT=/usr/lib/go go test ./...
}

package() {
  cd "tetrigo-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
