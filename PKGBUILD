# Maintainer: Shane <shane@shbox.me>
pkgname=gufetch
pkgver=1.0.0
pkgrel=1
pkgdesc='A CLI for fetching Github and Gitlab profiles.'
arch=('x86_64')
url="https://github.com/shanepaton/gufetch"
license=('MIT')
makedepends=('git' 'go')
source=("$pkgname-$pkgver"::'git+https://github.com//shanepaton/gufetch.git')
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
  go build -o gufetch
  cp gufetch build/gufetch
}

check() {
  msg2 "Checking $pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  msg2 "Packaging $pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  mkdir -p ~/.config/gufetch
  [[ -f filename ]] || cp config.yaml ~/.config/gufetch/
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
