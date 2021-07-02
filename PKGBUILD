pkgname=smock
pkgver=0.0.3
pkgrel=1
pkgdesc='Instantly transform your screenshots to beautiful mockups.'
arch=('x86_64')
url="https://github.com/fcjr/smock/"
license=('APACHE')
makedepends=('go')
source=("https://github.com/fcjr/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6610e220cafa7ba8c84602c33ad0bd7cd21686c9dd5e5183475118bd44a66a51')

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
  go build -ldflags "-s -w -X github.com/fcjr/smock/version.Version=v$pkgver" -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/cli "$pkgdir"/usr/bin/smock
}
