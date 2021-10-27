# Maintainer: Jordan Christiansen <xordspar0@gmail.com>
pkgname=liberal-crime-squad-svn
pkgver=4.07.5.r864
pkgrel=1
pkgdesc="A satirical console-based political role-playing/strategy game"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/lcsgame/"
license=('GPL2')
depends=('ncurses' 'sdl2' 'sdl2_mixer')
makedepends=('subversion')
source=($pkgname-$pkgver::'svn+https://svn.code.sf.net/p/lcsgame/code/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  local version="$(sed -En 's/AC_INIT.*\[([0-9.]+)\].*/\1/p' configure.ac)"
  local revision="$(svnversion)"
  printf "%s.r%s" "$version" "${revision//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  chmod 744 bootstrap
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Correct for bug in Makefile. Put the music where the game expects it.
  cd "$pkgdir/usr/share/lcs/art"
  mkdir ogg
  mv -t ogg/ *.ogg
  mkdir midi
  mv -t midi/ *.mid
}

# vim:set ts=2 sw=2 et:
