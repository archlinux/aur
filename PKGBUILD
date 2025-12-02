# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=tetrigo
pkgver=0.2.0
pkgrel=1
pkgdesc='Play Tetris in your terminal.'
arch=('x86_64')
url="https://github.com/Broderick-Westrope/tetrigo"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go>=1.23')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0347e2739e6fd7fc37667eb8873030f700d26e824d124d73ff8eb49c910946a8')

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
