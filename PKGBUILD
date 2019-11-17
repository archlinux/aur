# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: stef204 < base64 -d c3RlZjIwNEB5YW5kZXguY29tCg== >
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=mp
pkgver=5.35
pkgrel=1
pkgdesc="A text editor for programmers."
arch=(i686 x86_64)
url="http://triptico.com/software/mp.html"
license=('GPL')
# depends=('ncurses5-compat-libs')
makedepends=('gtk3' 'qt5-base')
optdepends=('gtk3: gtk frontend'
            'qt4: qt frontend')
options=('!emptydirs')
source=(http://triptico.com/download/mp/mp-$pkgver.tar.gz)

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
  cd "$srcdir/mp-$pkgver"

  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/bin/mp-5" "$pkgdir/usr/bin/mp-qt"
  install -Dm755 mp-{curses,gtk} "$pkgdir/usr/bin"
}
sha256sums=('f44117dcb849e4dcdbaa84b763b9d139d167d77c23adf36fc0f40b75072b48b4')
