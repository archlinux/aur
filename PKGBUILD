# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.18.3
pkgrel=1
pkgdesc="Music education and ear training software"
arch=(i686 x86_64)
url="http://www.solfege.org/"
license=('GPL3')
depends=('pygtk' 'libgtkhtml')
makedepends=('ghostscript' 'gnome-doc-utils' 'librsvg' 'libxslt'
             'lilypond' 'swig' 'texinfo' 'txt2man' 'pkg-config')
optdepends=('timidity++: Software MIDI support')
changelog=$pkgname.changelog
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        solfege.desktop
        make_swig2.patch)
md5sums=('c5d1f63db2a2a506d46108713e49a516'
         '22b89dcfd9e7c98ab238942139b8a970'
         'fd5866e4c1272bcd0aa3432a9dbe2e3e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  # fix for make bug
  # see http://code.google.com/p/solfege/issues/detail?id=197
  patch -Np1 -i ../make_swig2.patch

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
