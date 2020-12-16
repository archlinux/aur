# Maintainer: qs9rx < that nick at enjoys dot it>
# Contributor: David Manouchehri <d@32t.ca>

pkgname=dump1090-git
_gitname=dump1090
pkgver=0.r386.bff92c4
pkgrel=1
pkgdesc="Dump1090 is a simple Mode S decoder for RTLSDR devices. MalcolmRobb fork. Git version."
arch=('i686' 'x86_64')
url="https://github.com/MalcolmRobb/dump1090"
license=('BSD')
depends=('rtl-sdr')
provides=('dump1090')
makedepends=('git')
source=('git://github.com/MalcolmRobb/dump1090.git')
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/$_gitname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  # gcc10 tweaks
  sed -i 's/^struct stDF {/extern &/' dump1090.h
  sed -i 's/^struct {.*Internal state$/static &/' dump1090.h
  sed -i 's/^CFLAGS=.*$/& -fPIC/' Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make clean
  make PREFIX=/usr/
}
 
package() {
  install -Dm755 "$srcdir/$_gitname/dump1090" "$pkgdir/usr/bin/dump1090"
  install -Dm755 "$srcdir/$_gitname/view1090" "$pkgdir/usr/bin/view1090"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/$_gitname/public_html/" "$pkgdir/usr/share/$_gitname/"
}
