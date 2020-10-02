# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

_pkgname=dbus
_gourl="github.com/godbus/dbus"

pkgname="$_pkgname-go"
pkgver=5.0.3
pkgrel=1
pkgdesc="Native Go bindings for D-Bus"
arch=('x86_64' 'i686')
url="https://$_gourl"
license=('BSD')
depends=('go')
options=('!strip' '!emptydirs')
source=("https://$_gourl/archive/v$pkgver.tar.gz")
sha256sums=('49d27bde2861f5e5ab4195fddc5f38f25324aac3b32b3cc03e712cca3d2b75fa')


build() {
  godir="$srcdir/src/$_gourl"

  test -d "$godir/" && rm -rf "$godir/"
  mkdir -p "$(dirname "$godir")"
  mv "$_pkgname-$pkgver" "$godir/"
  cd "$godir/"

  GOPATH="$srcdir" go get -fix -v ./... 
}

check() {
  cd "src/$_gourl"

  GOPATH="$srcdir" go test -v
}

package() {
  GOPATH="usr/lib/go/"

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
