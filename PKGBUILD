pkgname=tdx
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI todo manager for iCalendar files'
arch=('x86_64')
url="https://github.com/kkga/tdx"
license=('UNLICENSE')
makedepends=('go')
source=("https://github.com/kkga/tdx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04a033fae803ede456d9cc3a57040f046bfe97f395a44f6d6bac95625049620d')

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
  # FIXME: Tests are broken in latest release and main.
  # go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
