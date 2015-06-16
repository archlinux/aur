# Maintainer: Heorhi Valakhanovich valahanovich@tut.by

pkgname=go-oracle
pkgver=20150616
pkgrel=1
pkgdesc="Go oracle. Source analysis tool"
arch=('x86_64' 'i686')
url="https://godoc.org/golang.org/x/tools/cmd/oracle"
license=('BSD')
depends=('go')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')
_gourl=golang.org/x/tools/cmd/oracle

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et: