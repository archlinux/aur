# Maintainer: orumin <dev at orum.in>

pkgname=diagram
pkgver=20170903
pkgrel=2
pkgdesc="CLI app to convert ascii arts into hand drawn diagrams written in go."
arch=('x86_64' 'i686')
url="https://github.com/esimov/diagram"
source=(fix_font_path.patch)
sha1sums=(4fbd6599370ecd7d41ce5d6f5abc3f63ae60ffe8)
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/esimov/diagram
_commit=40a4b96485b35e0bd70554f5d24fca84e4348d05

build() {
  GOPATH="$srcdir" go get -v -x $_gourl

  cd "$srcdir/src/$_gourl"
  git checkout "$_commit"
  patch -p1 < "$srcdir"/fix_font_path.patch
  GOPATH="/usr/lib/go:$srcdir" go build
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/src/$_gourl/diagram" "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/src/$_gourl/font/gloriahallelujah.ttf" "$pkgdir/usr/share/diagram/gloriahallelujah.ttf"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
