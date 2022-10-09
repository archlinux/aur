# Maintainer: Paul Clark <paul500clark at gmail dot com>
# Contributor: David Koenig <koenigdmj@gmail.com>
pkgname=bible-kjv
pkgver=4.38
pkgrel=3
pkgdesc="King James Bible, Concordance, and Command-Line Viewer"
arch=(x86_64)
url="https://tracker.debian.org/pkg/bible-kjv"
license=('GPL')
depends=('readline')
makedepends=('perl')
source=(https://ftp.debian.org/debian/pool/main/b/${pkgname}/${pkgname}_${pkgver}.tar.gz
	makefile.patch)
sha256sums=('890b4d16fa2c0a9930fd4e6df22c6182b696ac0c1c47d12dc513227c62d8f249'
            'aa8722a813d5dabd7f3f8a18b4c0b47d7c1a5680682bd15a1b2bc2871d553b19')

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
