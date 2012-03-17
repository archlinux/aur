# Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

# TODO:
#   bring in pyalsa, csound, mma
pkgname=solfege
pkgver=3.20.4
pkgrel=2
pkgdesc="Music education and ear training software"
arch=('i686' 'x86_64')
url="http://www.solfege.org/"
license=('GPL3')
depends=('pygtk' 'libgtkhtml')
makedepends=('ghostscript' 'gnome-doc-utils' 'librsvg' 'libxslt'
             'swig' 'texinfo' 'txt2man')
optdepends=('timidity++: or any MIDI player & MIDI-WAV converter'
            'mpg123: or any MP3 player'
            'lame: or any WAV-MP3 converter'
            'vorbis-tools: or any OGG player & WAV-OGG converter'
            'lilypond: for generating print-outs & score sheets'
            'texlive-bin: use LaTeX to replace HTML reports with DVI')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3a1914158ad218ad5b119ee4f719b567')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix for entire build
  export PYTHON=/usr/bin/python2

  # python2 fix for rogue Makefile
  sed -i 's/shell python/shell python2/g' help/Makefile

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # python2 fix for runtime
  for i in $(find "$pkgdir" -name '*.py'); do
    sed -i 's:^#!.*bin/python$:#!/usr/bin/python2:' "$i"
    sed -i 's:^#!.*bin/env python$:#!/usr/bin/env python2:' "$i"
  done

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
