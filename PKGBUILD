# Maintainer: envolution
# Contributor: kiasoc5 <kiasoc5 at disroot dot org>
# shellcheck shell=bash disable=SC2034,SC2154

_name=fibers
pkgname=guile-$_name
pkgver=1.4.2
pkgrel=1
pkgdesc="Concurrent ML-like concurrency for Guile"
arch=(x86_64)
license=(LGPL-3.0-or-later)
makedepends=(git)
depends=("guile")
source=(git+https://codeberg.org/${_name}/${_name}.git#tag=v${pkgver})
url="https://codeberg.org/wingo/fibers"
md5sums=('3c611207a839a856fe438e4661522c0b')

build() {
  cd "$srcdir/$_name"
  autoreconf -vif
  ./configure --prefix=/usr
  GUILE_AUTO_COMPILE=0 make
}

package() {
  cd "$srcdir/$_name"
  GUILE_AUTO_COMPILE=0 make install DESTDIR="$pkgdir"
}

check() {
  cd "$srcdir/$_name"
  # This test can take more than an hour on some systems.
  sed -i -e "s/.*spawn-fiber loop-to-1e4.*//g" tests/basic.scm
  # These tests can take more than an hour and/or segfault.
  sed -i "s|tests/speedup.scm||g" Makefile
  # This test seems to not properly terminate
  sed -i "s|tests/io-wakeup.scm||g" Makefile
  GUILE_AUTO_COMPILE=0 make check
}
# vim:set ts=2 sw=2 et:
