# Maintainer: yyyyyyy <contact@yyyyyyyan.tech>
pkgname=sniptt-ots
pkgver=0.3.1
pkgrel=1
pkgdesc='Share end-to-end encrypted secrets with others via a one-time URL'
arch=('x86_64')
url='https://github.com/sniptt-official/ots'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('09f0b0d7ca44ec8414dbf631009df8c00f4750247c0f9ba25a32f0aa270e09cc')

prepare() {
  cd "ots-$pkgver"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

build() {
  cd "ots-$pkgver"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ots -ldflags "-s -w -X github.com/sniptt-official/ots/build.Version=$pkgver"
}

check() {
  cd "ots-$pkgver"
  go test ./...
}

package() {
  cd "ots-$pkgver"
  install -Dm755 ots "$pkgdir/usr/bin/ots"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
