# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=slib
pkgver=3b5
pkgrel=4
pkgdesc='Library of functions for Scheme implementations'
arch=(any)
url='https://people.csail.mit.edu/jaffer/SLIB.html'
license=(custom)
depends=(guile)
options=(emptydirs)
source=("https://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip")
sha256sums=('f8b64a9820c2ccbdb263a0cb7bcf4caadce0857fdf4e2f52111ca33b4a131760')

prepare() {
  cd $pkgname

  # Path fix
  sed -r -i 's,/usr/(local/)?lib/slib,/usr/share/slib,g' *.init

  # Add missing headers and definitions
  sed -i "1s,^,#!/bin/sh\nexport SCHEME_LIBRARY_PATH=/usr/share/slib/\nVERSION=$pkgver\n,;s,\${S48_VICINITY},/usr/share/scheme48/,g" slib.sh
}

package() {
  cd $pkgname

  install -d "$pkgdir"/usr/{bin,share/{guile/site,slib}}
  install -m644 *.scm *.init *.xyz *.txt *.dat *.ps "$pkgdir/usr/share/slib/"
  install -Dm755 slib.sh "$pkgdir/usr/bin/slib"
  ln -s /usr/share/slib "$pkgdir/usr/share/guile/site/"
  install -Dm644 slib.info "$pkgdir/usr/share/info/slib.info"
  install -Dm644 slib.1 "$pkgdir/usr/share/man/man1/slib.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
