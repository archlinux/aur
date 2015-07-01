# Maintainer: Alain Kalker <a.c.kalker at gmail dot com>

pkgname=katahdin
pkgver=0.2
pkgrel=1
pkgdesc="A programming language where the syntax and semantics are mutable at runtime"
arch=('any')
url="http://www.chrisseaton.com/katahdin/"
license=('BSD')
depends=('mono' 'gtk2')
optdepends=("gtk-sharp-2: for the debugger")
source=(http://www.chrisseaton.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d79e6505307ef6855bad1baea75efcae')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export KATAHDIN=.:library
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m755 "$pkgdir/usr/lib/$pkgname"
  cp -dpr --no-preserve=ownership *.dll *.exe *.mdb \
    "$pkgdir/usr/lib/$pkgname"
  install -d -m755 "$pkgdir/usr/share/$pkgname"
  cp -dpr --no-preserve=ownership demos library logo tests readme.txt \
    "$pkgdir/usr/share/$pkgname"
  for f in katahdind katahdini; do
    install -Dm755 $f "$pkgdir/usr/bin/$f"
    sed -i -e "/^PATH=/iexport KATAHDIN=/usr/lib/$pkgname:/usr/share/$pkgname/library" \
      "$pkgdir/usr/bin/$f"
  done
}

# vim:set ts=2 sw=2 et:
