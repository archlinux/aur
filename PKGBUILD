# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mp
pkgver=5.61
pkgrel=1
pkgdesc="text editor for programmers"
arch=(i686 x86_64)
url="http://triptico.com/software/mp.html"
license=('GPL')
# depends=('ncurses5-compat-libs')
makedepends=('gtk3' 'qt5-base')
optdepends=('gtk3: gtk frontend'
            'qt5-base: qt frontend')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/ttcdt/mp-5.x/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('b36e357096ed639f028e73219bebac46d06c7adf7a46e58a67ebe8e6ab3fa4a3')


prepare() {
  sed -i "s|ncursesw/||" mp-5.x-$pkgver/{config.sh,mpv_curses.c}
  }

build() {
  cd "mp-5.x-$pkgver"

  # curses
  ./config.sh --prefix=/usr \
              --without-gtk \
              --without-qt4
  make
  cp mp-5 mp-curses
  #make clean

  # gtk
  ./config.sh --prefix=/usr \
              --without-curses \
              --without-qt4
  make
  cp mp-5 mp-gtk
  #make clean

  # qt
  ./config.sh --prefix=/usr \
              --without-curses \
              --without-gtk
  make
}

package() {
  cd "mp-5.x-$pkgver"

  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/bin/mp-5" "$pkgdir/usr/bin/mp-qt"
  install -Dm755 mp-{curses,gtk} "$pkgdir/usr/bin"
}

