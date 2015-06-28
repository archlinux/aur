# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Tom Willemsen <tom at ryuslash dot org>
# Contributor: Uwe <moc liamg skcuneelu <-- look what I did there>
# Contributor: Nicolas Pouillard <nicolas dot pouillard at gmail dot com>
# Contributor: Vain

pkgname=mu
pkgver=0.9.11
pkgrel=1
pkgdesc="A collection of utilities for indexing and searching Maildirs"
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
install=$pkgname.install
license=('GPL3')
depends=('xapian-core' 'gmime' 'sqlite3')
optdepends=('cronie: Updating index regularly')
conflicts=('mailutils')
source=("https://github.com/djcb/mu/archive/v$pkgver.tar.gz")
md5sums=('6b774454b181c9814992e7c9a24b9441')

prepare() {
  cd $srcdir/mu-$pkgver
  cd toys/mug
  sed -i 's|MUGDIR|"/usr/share/pixmaps"|g' mug.c
}

build() {
  cd $srcdir/mu-$pkgver
  # msg2pdf and mug will be built only if webkitgtk is installed
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/mu-$pkgver
  make DESTDIR=$pkgdir install
  # if msg2pdf and mug were built, install them
  # if not, remove the unneeded mug manpage
  if [ -f toys/msg2pdf/msg2pdf ]; then
    install -m755 toys/msg2pdf/msg2pdf $pkgdir/usr/bin/msg2pdf
  fi
  if [ -f toys/mug/mug ]; then
    install -m755 toys/mug/mug $pkgdir/usr/bin/mug
    install -Dm644 toys/mug/mug.svg $pkgdir/usr/share/pixmaps/mug.svg
  else
    rm $pkgdir/usr/share/man/man1/mug.1
  fi
}
