# Maintainer: Paul Clark <paul500clark at gmail dot com>
# Contributor: David Koenig <koenigdmj@gmail.com>
pkgname=bible-kjv
pkgver=4.30
pkgrel=1
pkgdesc="King James Bible, Concordance, and Command-Line Viewer"
arch=(i686 x86_64)
url="http://www.debian.org/"
license=('GPL')
depends=('glibc')
makedepends=('perl')
source=(http://ftp.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.tar.gz
	makefile.patch)
md5sums=('0fd7710b7d5c60543756701474cc9d01'
         'e234e246b418fbd75a3855e321775a9e')

package () {
  patch -p1 < makefile.patch

  cd $pkgname

  # upstream ebuild wants "make all", not just "make"
  make DEST="/usr" DESTLIB="/usr/share/$pkgname" MAKEFLAGS="-j1" all || return 1
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
