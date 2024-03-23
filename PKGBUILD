# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: bemasher <bemasher@gmail.com>

pkgname=rtlamr
pkgver=0.9.3
pkgrel=3
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('i686' 'x86_64')
url="https://github.com/bemasher/rtlamr"
license=('AGPL3')
depends=('rtl-sdr')
makedepends=('go')
source=("https://github.com/bemasher/rtlamr/archive/v${pkgver}.tar.gz")
sha256sums=('544f50826f874cc436a0b9cf3d72a6c298ddb308d4ea5f088dad233c5d319fc1')

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
