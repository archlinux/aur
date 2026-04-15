# Maintainer: Paul Clark <paul500clark at gmail dot com>
# Contributor: David Koenig <koenigdmj@gmail.com>
pkgname=bible-kjv
pkgver=4.42
pkgrel=1
pkgdesc="King James Bible, Concordance, and Command-Line Viewer"
arch=(x86_64)
url="https://tracker.debian.org/pkg/bible-kjv"
license=('GPL')
depends=('readline')
makedepends=('perl')
source=(https://ftp.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.tar.gz
	makefile.patch)
sha256sums=('058fa63c829f77c9c93092a98c5d72b9f4163dfd46b4b1994b9a3ff8ed828478'
            '292f4f1f354741ed5da18486a27e6f5290f5a26d949eddfe25a80b7f91ae8e28')

package () {
  patch -p1 < makefile.patch

  cd work

  export MAKEFLAGS="-j1"

  # upstream ebuild wants "make all", not just "make"
  make DEST="/usr" DESTLIB="/usr/share/$pkgname" all || return 1
  make DEST="$pkgdir/usr" DESTLIB="$pkgdir/usr/share/$pkgname" install

  # copy for user convenience
  install -D -m644 bible.rawtext \
    $pkgdir/usr/share/$pkgname/kjv-uncompressed.txt

  cd debian
  make randverse
  install randverse $pkgdir/usr/bin
  gzip randverse.1
  install randverse.1.gz $pkgdir/usr/share/man/man1
}

# vim:set ts=2 sw=2 et:
