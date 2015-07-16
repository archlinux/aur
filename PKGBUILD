# Maintainer: Andrew Antle <andrew dot antle at gmail dot com>
# Contributor: Calvin McAnarney <csm@gmx.us>
# Contributor: Julien Pecqueur <jpec@julienpecqueur.com>
# Contributor: Sergiusz Urbaniak <sergiusz.urbaniak@gmail.com>

pkgname=plan9port-git
pkgver=5d86ecd
pkgrel=1
pkgdesc="port of many Plan 9 programs to Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://swtch.com/plan9port/"
license=('custom')
depends=('xorg-server' 'libxt' 'libxext' 'fuse')
optdepends=('python2: for the codereview script')
makedepends=('git')
provides=('plan9port')
install='plan9.install'
conflicts=('9base' 'plan9port')
options=('!zipman' 'staticlibs')
source=('git+https://github.com/9fans/plan9port'
        'plan9.sh')
md5sums=('SKIP'
         'c884c3c90a107f1a178718c304c67d30')

package() {
  cd "$srcdir/plan9port"

  # Try the gentoo way for fixing hardcoded paths
  PLAN9=/usr/lib/plan9
  grep --null -l -r '/usr/local/plan9' | xargs --null sed -i "s!/usr/local/plan9!${PLAN9}!g"

  d=usr/lib

  ./INSTALL -b
  install -Dm755 ../../plan9.sh "$pkgdir/etc/profile.d/plan9.sh"
  install -d "$pkgdir/$d"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r "$srcdir/plan9port" "$pkgdir/$d/plan9"
  cd "$pkgdir/$d/plan9"
  ./INSTALL -c -r "$pkgdir/$d/plan9"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Clean up
  rm -rf .git/
  rm -f .gitignore
  rm -f config install.log install.sum install.txt configure Makefile INSTALL \
    LICENSE

  # Fix python scripts
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'

  # Package text files
  for i in CHANGES CONTRIBUTORS README.md TODO; do
    install -m644 $i "$pkgdir/usr/share/doc/$pkgname"
    rm -f $i
  done

  # Decompress the plan9 man pages
  for i in `find $pkgdir/$d/plan9/man -type f`; do
    if [ ${i##*.} = "gz" ]; then
      gunzip "$i"
    fi
  done

  # Once more
  grep --null -l -r "$pkgdir$PLAN9" | xargs --null sed -i "s!$pkgdir$PLAN9!${PLAN9}!g" || true
  grep --null -l -r "/build/plan9port/pkg/plan9port/$PLAN9" | xargs --null sed -i "s!/build/plan9port/pkg/plan9port/$PLAN9!${PLAN9}!g" || true
}

