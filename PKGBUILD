# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=loccount
pkgver=2.12
pkgrel=1
pkgdesc="Count source lines of code in a project."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoc' 'go' 'xmlto')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f6e43ddfa0a3b06f5cb7e8f4653ce02f754e95f4f1351ca0a71a9f3af0f99c127546a6e7ebf1b8c31d7cc8d21eea11b30767820e8225ffe6c2fd6772b0253503')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  printf "module gitlab.com/esr/loccount\n" > go.mod
}

build() {
  cd "$pkgname-$pkgver"

  make loccount loccount.1
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
