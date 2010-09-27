# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.17.0
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
        solfege.desktop)
md5sums=('267fae9d16699761701c25529c65f440'
         '22b89dcfd9e7c98ab238942139b8a970')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make

  #-- debug --#
  # see http://code.google.com/p/solfege/issues/detail?id=197
  if ! test -f solfege/soundcard/_solfege_c_midi.so; then
    error "MIDI module not built"
    return 1
  fi
  #-- debug --#
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
