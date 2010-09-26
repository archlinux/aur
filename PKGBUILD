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
md5sums=('3c7c4ca1774260ae18e6346d0d1f3c82'
         '22b89dcfd9e7c98ab238942139b8a970')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  sed -i 's/SWIG_VERSION="unknown"/SWIG_VERSION="1.3"/' configure
  sed -i 's:/usr/src/linux/include:/usr/src/linux-2.6.35-ARCH64/include:' \
    solfege/soundcard/Makefile

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
