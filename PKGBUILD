# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=scid-vs-pc-svn
pkgver=r1714
pkgrel=1
pkgdesc="A usability and bug-fix fork of Shane's Chess Information Database (SVN version)"
arch=('i686' 'x86_64')
url="http://scidvspc.sourceforge.net/"
license=('GPL')
depends=('python2' 'tkimg')
makedepends=('svn')
optdepends=('snack: for sound support'
            'tdom-git: for correspondence chess support')
conflicts=('scid' 'scid_vs_pc' 'fics-timeseal')
install=$pkgname.install
source=("$pkgname"::'svn://svn.code.sf.net/p/scidvspc/code'
        "$pkgname-Makefile.diff"
        'scid-vs-pc.desktop')
sha1sums=('SKIP'
          'b42149890aae56ddb1fcc16949664e288535a1ea'
          '994abfa617b2eec447ed1d59c82f7c8c89430bc1')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 -i ../$pkgname-Makefile.diff
}

build() {
  cd "$srcdir/$pkgname"

  ./configure BINDIR=/usr/bin \
    SHAREDIR=/usr/share/scid \
    TCL_VERSION="8.6"

  make

  sed -i 's/python/python2/' pgnfix
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  # Timeseal
  install -Dm755 timeseal/timeseal.Linux-i386 "$pkgdir/usr/bin/timeseal"

  # Desktop
  install -Dm644 icons/scid.png "$pkgdir/usr/share/pixmaps/scid.png"
  install -Dm644 "$srcdir/scid-vs-pc.desktop" \
    "$pkgdir/usr/share/applications/scid-vs-pc.desktop"
}

# vim:set ts=2 sw=2 et:
