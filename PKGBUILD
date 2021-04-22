# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=ethr
pkgver=1.0.0
pkgrel=2
pkgdesc="Ethr is a Network Performance Measurement Tool for TCP, UDP & HTTP"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Microsoft/ethr"
license=('MIT')
makedepends=(
  'go'
  'git'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Microsoft/ethr/archive/v${pkgver}.tar.gz")
sha256sums=('c4bf9d6d4e0659f491b6de6d66ddfe3735d8f6fa791debe9e8bfe0aa0e93ddd3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # Download dependencies
  go get -u
  go mod tidy

  # Build
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/ethr"
}
