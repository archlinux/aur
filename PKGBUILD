# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# if you switch from freetype2 from [extra] to freetype2-infinality-ultimate,
# delete the $srcdir directory before building

pkgname=lilypond-git
pkgver=2.19.81.28068
pkgrel=1
pkgdesc="An automated music engraving system (Git snapshot)"
arch=('i686' 'x86_64')
url="http://lilypond.org/"
license=('GPL')
depends=('guile1.8' 'pango' 'python2' 'ttf-dejavu' 'fontconfig' 'freetype2' 'ghostscript')
makedepends=('fontforge' 'git' 'gsfonts' 't1utils-git' 'dblatex'
	     'tex-gyre-fonts' 'texlive-langcyrillic' 'texi2html' 'netpbm')
optdepends=('extractpdfmark: for reducing the size of pdf output significantly'
	    'tk: for the gui')
provides=('lilypond')
conflicts=('lilypond' 'lilypond-devel')
source=(git://git.savannah.gnu.org/lilypond.git)
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd lilypond/
  printf %s.%s $(grep VERSION_DEVEL VERSION | cut -d= -f2) $(git rev-list --count HEAD)
}

prepare() {
  cd lilypond/

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  sed -i 's+guile-config-1.8+guile-config1.8+' aclocal.m4
}


build() {
  cd lilypond/
  export PYTHON="python2"
  export PYTHON_CONFIG="python2-config"
  [[ -f config.hh ]] && rm config.hh
  ./autogen.sh --noconfigure
  [[ -d build ]] || mkdir build
  cd build
  ../configure --prefix=/usr \
      --disable-documentation \
      --enable-guile2=no
  make -j1 
}

package() {
  cd lilypond/build
  make DESTDIR="$pkgdir/" vimdir="/usr/share/vim/vimfiles" install
  rm -rf "$pkgdir/usr/share/man"
}
