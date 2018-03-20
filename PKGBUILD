# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kydpdict-git
_pkgname=kydpdict
pkgver=r389.224576a
pkgrel=1
pkgdesc='Qt interface for YDP Collins and PWN Oxford dictionaries '
arch=('i686' 'x86_64')
url='https://github.com/ytmytm/kydpdict'
license=('GPL')
depends=(qt3)
makedepends=(git gcc)
provides=(kydpdict)
conflicts=(kydpdict)
replaces=(kydpdict)
install="kydpdict.install"
source=('git+https://github.com/ytmytm/kydpdict')
sha256sums=('SKIP')
_gitname='kydpdict'

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
prepare(){
  cd "$srcdir/$_pkgname"
  tar zxf contrib/kydpdict-0.9.3-oxpwnsnd.tar.gz
  patch -Np1 -i kydpdict-0.9.3-oxpwnsnd/kydpdict-0.9.3-pwnoxsnd.patch
}
build(){
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --with-qt-dir=/usr/lib/qt3 --with-qt-includes=/usr/include/qt3
  sed 's/QT_LIB=-lqt-mt/QT_LIB=-lqt-mt -lz/' -i src/Makefile
  make
  gcc -O2 -Wall kydpdict-0.9.3-oxpwnsnd/exwaves.c -o exwaves
}
package(){
  cd "$srcdir"/$_gitname
  make DESTDIR="$pkgdir/" install
  install -Dm644 $_pkgname.png $pkgdir/usr/share/pixmaps/$_pkgname.png
  install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm644 contrib/$_pkgname.1 $pkgdir/usr/share/man/man1/$_pkgname.1
  install -dm755 $pkgdir/usr/share/man/pl/man1
  iconv -f iso8859-2 -t utf8 contrib/$_pkgname.pl.1 > $pkgdir/usr/share/man/pl/man1/$_pkgname.1
  install -Dm755 exwaves $pkgdir/usr/bin/exwaves
}
