# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=irtt-git
pkgver=0.9.0.r47.g1420a22
pkgrel=1
pkgdesc="Isochronous round-trip tester"
arch=('i686' 'x86_64')
url="https://github.com/heistp/irtt"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go-pie')
provides=('irtt')
conflicts=('irtt')
_gourl=github.com/heistp/irtt


prepare() {
  GOPATH="$srcdir" go get -d "$_gourl"
}

pkgver() {
  cd "src/$_gourl"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir" \
    go get \
      -ldflags "-extldflags $LDFLAGS" \
      "$_gourl"/...
}

check() {
  GOPATH="$srcdir" go test "$_gourl"
}

package() {
  install -Dm755 "bin/irtt" "$pkgdir/usr/bin/irtt"

  cd "$srcdir/src/$_gourl"
  install -Dm644 "doc"/irtt.{html,md} -t "$pkgdir/usr/share/doc/irtt"
  install -Dm644 "doc/irtt.1" "$pkgdir/usr/share/man/man1/irtt.1"
}
