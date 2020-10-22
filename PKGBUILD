# Maintainer: Chris Berkhout <chris@chrisberkhout.com>
pkgname=pgn-extract
pkgver=19.04
pkgrel=1
pkgdesc="A Portable Game Notation (PGN) Manipulator for Chess Games"
arch=('x86_64')
url="https://www.cs.kent.ac.uk/people/staff/djb/pgn-extract/"
license=('GPL')
depends=('glibc')
source=("https://www.cs.kent.ac.uk/~djb/pgn-extract/pgn-extract-${pkgver//\./-}.tgz")
sha256sums=('8fac35b02983b19266ee10d064e21e2686ddda97b383cf8a804158d1f6a23270')

build() {
  cd "$srcdir/$pkgname"

  make
}

check() {
  cd "$srcdir/$pkgname/test"

  ./runtests

  # fix for case sensitivity
  ls infiles/test-E.pgn || ln -s test-e.pgn infiles/test-E.pgn
  ls infiles/test-s.pgn || ln -s test-S.pgn infiles/test-s.pgn
  ls infiles/test-w.pgn || ln -s test-W.pgn infiles/test-w.pgn

  make -k all
}

package() {
  cd "$srcdir/$pkgname"

  install -D -m 755 pgn-extract "$pkgdir/usr/bin/pgn-extract"
  install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/share/$pkgname/"
  cp *.{pgn,html,css,xml} "$pkgdir/usr/share/$pkgname/"
}
