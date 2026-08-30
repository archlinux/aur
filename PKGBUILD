# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=slib
pkgver=3c2
pkgrel=1
pkgdesc='Library of functions for Scheme implementations'
arch=(any)
url='https://people.csail.mit.edu/jaffer/SLIB.html'
license=(custom)
depends=(guile)
options=(emptydirs)
source=("https://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip")
b2sums=('ceb0a8a9d94a78128fd9903396a60f26843cac27dd5b8a60116ff0ac910ed2636674f9ed8a0f6aeb681f95be154a0404e76c70230104e985305a76439645afe1')

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
