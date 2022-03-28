pkgname=whats
pkgver=1.0.0
pkgrel=1
pkgdesc='queries wikipedia for a summary of something'
arch=('x86_64')
url="https://github.com/snoglobe/whats"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname-$pkgver"::'git+https://github.com/snoglobe/whats.git')
sha256sums=('SKIP')

prepare(){
  mkdir -p "$pkgname-$pkgver"
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
  msg2 "Building $pkgname-$pkgver"
  go build whats.go
  cp whats build/whats
}

package() {
  msg2 "Packaging $pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
