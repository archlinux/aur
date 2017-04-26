# Maintainer: Vincent Loupmon <vloupmong@gmail.com>

pkgname=slit
pkgver=20170426
pkgrel=1
pkgdesc="A modern PAGER for viewing logs, get more than most in less time. Written in Go"
arch=('x86_64' 'i686')
url="https://github.com/tigrawap/slit"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/tigrawap/slit

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/...
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
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