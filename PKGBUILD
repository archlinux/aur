# Maintainer: Andrea Girotto <andreagirotto+arch at gmail dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gotk3-git
pkgver=r817.d1d3434
pkgrel=1
pkgdesc="Go bindings for GTK3"
arch=('x86_64' 'i686')
url="https://github.com/gotk3/gotk3"
license=('ISC')
depends=('go' 'gtk3')
makedepends=('git')
conflicts=('gotk3')
provides=('gotk3')
options=('!strip' '!emptydirs')
_gourl=github.com/gotk3/gotk3

pkgver() {
  cd "$srcdir/src/$_gourl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x $_gourl/gtk
}

package() {
  mkdir -p "$pkgdir/usr/lib/go"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/usr/lib/go"
  rm -r "$pkgdir/usr/lib/go/src/$_gourl/.git"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find "$pkgdir/usr/lib/go" \
        -name ".*" -prune -exec rm -r '{}' \;
}
