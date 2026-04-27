# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: bemasher <bemasher@gmail.com>

pkgname=rtlamr
pkgver=0.9.5
pkgrel=1
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('i686' 'x86_64')
url="https://github.com/bemasher/rtlamr"
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go')
source=("https://github.com/bemasher/rtlamr/archive/v${pkgver}.tar.gz")
sha256sums=('b880ca9c6391e2468e215596668f2ba6a66f953dfc4074c15b17a210f9b0f22d')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build
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
  install -p -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
