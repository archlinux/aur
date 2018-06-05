# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: sickhate <sickhate@tux-linux.net>

pkgname=solfege
pkgver=3.22.2
pkgrel=5
pkgdesc="Music education and ear training software"
arch=('x86_64')
url="https://www.gnu.org/software/solfege/"
license=('GPL3')
groups=('pro-audio')
depends=('pygtk' 'librsvg')
makedepends=('ghostscript' 'gnome-doc-utils' 'libxslt'
             'swig' 'texinfo' 'txt2man')
optdepends=('timidity++: or any MIDI player & MIDI-WAV converter'
            'mpg123: or any MP3 player'
            'lame: or any WAV-MP3 converter'
            'vorbis-tools: or any OGG player & WAV-OGG converter'
            'lilypond: for generating print-outs & score sheets'
            'texlive-bin: use LaTeX to replace HTML reports with DVI')
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha512sums=('475d2eea54d0c6b2cb11a5271a02ca64e79c45fb6155d87a01b16e826669a07cca0b4c2543cbbb1ce8d36412ccfd64e8052de1efad3db19f34d7e0a984d7459a'
            'SKIP')
validpgpkeys=('D1820E3CCB05255CCD9855988143F7EEA5E43EA3')

prepare() {
  cd "${pkgname}-${pkgver}"
  # python2 fix for entire build
  export PYTHON=/usr/bin/python2

  # python2 fix for rogue Makefile
  sed -i 's/shell python/shell python2/g' help/Makefile

  # fix static python shebang
  sed -i 's/python/python2/g' "${pkgname}/_version.py"
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  # python2 fix for runtime
  for i in $(find "$pkgdir" -name '*.py'); do
    sed -i 's:^#!.*bin/python$:#!/usr/bin/python2:' "$i"
    sed -i 's:^#!.*bin/env python$:#!/usr/bin/env python2:' "$i"
  done

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
