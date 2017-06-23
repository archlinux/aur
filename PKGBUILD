# Maintainer: Paulo Diovani <paulo@diovani.com>

pkgname=forego-git
pkgver=20170623
pkgrel=1
pkgdesc="Foreman in Go"
arch=('x86_64' 'i686')
url="https://github.com/ddollar/forego"
license=('UNLICENSED')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
provides=('forego')
_gourl="github.com/ddollar/forego"
_goroot="/usr/lib/go"

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}

  # Remove git repos metadata
  rm -vrf "$srcdir/src/$_gourl/.git"
}

check() {
  if [ -z "$GOPATH" ]; then GOPATH=$_goroot; fi
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  if [ -z "$GOPATH" ]; then GOPATH=$_goroot; fi
  mkdir -p "$pkgdir/$GOPATH/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/$GOPATH/bin"

  mkdir -p "$pkgdir/usr/local/bin"
  pushd "$pkgdir/usr/local/bin"

  for f in "$(realpath --relative-to=./ "$pkgdir/$GOPATH/bin")"/*; do
    ln -s "$f" .
  done

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

