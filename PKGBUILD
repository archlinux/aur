# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt
pkgver=0.9.0
pkgrel=6
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('GPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heistp/irtt/archive/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/heistp/irtt/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('f9767fa9259db1932d011ed0a9f9528c70411878668ba0db6451264557ddd800'
            'SKIP')
validpgpkeys=('35C296FC733AA777B03DB9A8CAEC8F418885D165')  # Pete Heist <pete@eventide.io>


export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -modcacherw"  # -mod=readonly

build() {
  cd "$pkgname-$pkgver"

  go mod init "github.com/heistp/irtt"
  go build \
    "github.com/heistp/irtt/cmd/irtt"
}

check() {
  cd "$pkgname-$pkgver"

  go test \
    ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "irtt" -t "$pkgdir/usr/bin"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" -t "$pkgdir/usr/share/man/man1"
}
