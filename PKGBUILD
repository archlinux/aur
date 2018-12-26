# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt
pkgver=0.9.0
pkgrel=1
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("https://github.com/heistp/irtt/archive/v$pkgver.tar.gz"
        "https://github.com/heistp/irtt/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
sha256sums=('f9767fa9259db1932d011ed0a9f9528c70411878668ba0db6451264557ddd800'
            'SKIP')
validpgpkeys=('35C296FC733AA777B03DB9A8CAEC8F418885D165')  # Pete Heist <pete@eventide.io>


prepare() {
  mkdir -p "$srcdir/gopath"

  cd "$pkgname-$pkgver"
  GOPATH="$srcdir/gopath" go get -d .

  cd "$srcdir"
  ln -s "$srcdir/$pkgname-$pkgver" "$srcdir/gopath/src/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/gopath/src/$pkgname-$pkgver"

  GOPATH="$srcdir/gopath" \
    go get \
      -ldflags "-extldflags $LDFLAGS" \
      ./...
}

check() {
  cd "$srcdir/gopath/src/$pkgname-$pkgver"

  GOPATH="$srcdir/gopath" go test
}

package() {
  install -Dm755 "gopath/bin/irtt" "$pkgdir/usr/bin/irtt"

  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" "$pkgdir/usr/share/man/man1/irtt.1"
}
