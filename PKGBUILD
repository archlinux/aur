# Maintainer: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mp
pkgver=5.2.10
pkgrel=1
pkgdesc="A text editor for programmers."
arch=(i686 x86_64)
url="http://triptico.com/software/mp.html"
license=('GPL')
makedepends=('gtk3' 'qt4' 'ncurses5-compat-libs')
optdepends=('gtk3: gtk frontend'
            'qt4: qt frontend')
options=('!emptydirs')
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz)
sha256sums=('f3ce1831d2cfb42a8540d197a9fdad163ecd17883a57cd798a2f30bfe791ddc1')

prepare() {
  sed -i "s|ncursesw/||" ${srcdir}/mp-$pkgver/{config.sh,mpv_curses.c}
}

build() {
  cd "$srcdir/mp-$pkgver"

  # curses
  ./config.sh --prefix=/usr \
              --without-gtk \
              --without-qt4
  make
  cp mp-5 mp-curses
  make clean

  # gtk
  ./config.sh --prefix=/usr \
              --without-curses \
              --without-qt4
  make
  cp mp-5 mp-gtk
  make clean

  # qt
  ./config.sh --prefix=/usr \
              --without-curses \
              --without-gtk
  make
}

package() {
  cd "$srcdir/mp-$pkgver"

  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/bin/mp-5" "$pkgdir/usr/bin/mp-qt"
  install -Dm755 mp-{curses,gtk} "$pkgdir/usr/bin"
}
