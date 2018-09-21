# Maintainer: bemasher <bemasher@gmail.com>

pkgname=rtlamr-git
pkgver=0.9.0
pkgrel=1
pkgdesc="An rtl-sdr receiver for Itron ERT compatible smart meters operating in the 900MHz ISM band."
arch=('x86_64' 'i686')
url="git+https://github.com:bemasher/rtlamr.git#tag=v0.9.1"
license=('AGPL3')
depends=('go' 'rtl-sdr')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/bemasher/rtlamr

build() {
  GOPATH="$srcdir" go get -v ${_gourl}/...
}

check() {
  GOPATH="$srcdir" go test -v ${_gourl}/...
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
