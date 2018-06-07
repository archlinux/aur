# Maintainer: Bill Kaguru Wanjohi <bill@ka.guru>

pkgname=k6
pkgver=0.21.1
pkgrel=1
pkgdesc="A modern load testing tool, using Go and JavaScript"
arch=('x86_64' 'i686')
url="https://github.com/loadimpact/k6"
license=('AGPL3')
depends=('go')
makedepends=('mercurial')
options=('!strip' '!emptydirs')
_gourl=github.com/loadimpact/k6

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

# vim:set ts=2 sw=2 et:
