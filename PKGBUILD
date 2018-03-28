# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel
pkgver=2.19.81
pkgrel=3
pkgdesc="An automated music engraving system (development version)"
arch=('i686' 'x86_64')
url="http://lilypond.org/"
license=('GPL')
depends=('fontconfig'
         'freetype2'
         'guile1.8'
         'pango'
	 'glib2'
         'python2')
makedepends=('fontforge'
             'gsfonts'
             't1utils-git'
	     'ghostscript'
             'texlive-core'
	     'tex-gyre-fonts'
	     'texlive-langcyrillic'
	     'dblatex')
optdepends=('extractpdfmark: for reducing the size of pdf output significantly'
	   'tk: for the gui')
provides=("lilypond=$pkgver")
conflicts=('lilypond' 'lilypond-git')
source=("http://lilypond.org/downloads/sources/v2.19/lilypond-${pkgver}.tar.gz" "no_fontforge-versioncheck.patch")
sha256sums=('2ac299045dc4a8fa3bd7c67af7b06877b21cdb50321fec5baa558e3173ed646c'
            'e74391f718babb984c5f637397162cf096c4716f5b9a21346ec76035cfc80817')

prepare() {
  cd "$srcdir/lilypond-$pkgver"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  
  patch -Np1 < $srcdir/no_fontforge-versioncheck.patch
  rm -rf python/out/
}

build() {
  cd "$srcdir/lilypond-$pkgver"

  export PYTHON="python2"
  export PYTHON_CONFIG="python2-config"
  export GUILE=/usr/bin/guile1.8
  export GUILE_CONFIG=/usr/bin/guile-config1.8

  ./autogen.sh --noconfigure
  [[ -d build ]] || mkdir build
  cd build
  ../configure --prefix=/usr \
               --disable-documentation 
	        
  # FIXME: the extra LDFLAG should not be needed;
  # this is a regression somewhere
  make
}

package() {
  cd "$srcdir/lilypond-$pkgver/build"
  make DESTDIR="$pkgdir/" \
       vimdir="/usr/share/vim/vimfiles" install

  rm -rf "$pkgdir/usr/share/man"
}
