# Maintainer: AlexanderGhosty <byck.sash@gmail.com>

pkgname=termf1
pkgver=2.1.1
pkgrel=1
pkgdesc="Terminal UI: Dashboard for Formula-1"
arch=('x86_64')
url="https://github.com/dk-a-dev/termf1"
license=('LicenseRef-Unknown')
depends=('glibc')
makedepends=('go')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('672f73e7fc75292bfe2a66be4c10506a5b3e8584050d6627a6cffd5845c9f9a7')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="$srcdir/gopath"

  go build -ldflags "-linkmode=external -s -w -X main.version=v$pkgver" -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
