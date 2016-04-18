# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lilypond-devel
pkgver=2.19.40
pkgrel=1
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
             'gsfonts-cyr' # from boohomil's infinality-bundle-fonts repo
             't1utils'
	     'ghostscript'
             'texlive-core>=2011.23170'
	     'tex-gyre-fonts'
)
optdepends=('netpbm: building HTML documentation'
            'imagemagick: building HTML documentation'
            'ttf-kochi-substitute: building HTML documentation'
            'texi2html>=1.82: building HTML documentation'
            'rsync: installing HTML documentation')
provides=("lilypond=$pkgver")
conflicts=('lilypond' 'lilypond-git')
source=("http://download.linuxaudio.org/lilypond/sources/v2.19/lilypond-${pkgver}.tar.gz" 'no_fontforge-versioncheck.patch')
sha256sums=('1178fa50b8ee2db3230970801507cddf22c5885c821fffbf8f2c2f0cdbbeeb28'
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

  export GUILE=/usr/bin/guile
  export GUILE_CONFIG=/usr/bin/guile-config
  export PYTHON="python2"
  export PYTHON_CONFIG="python2-config"
  export GUILE=/usr/bin/guile1.8
  export GUILE_CONFIG=/usr/bin/guile-config1.8

  ./autogen.sh --prefix=/usr \
              --disable-documentation 
	        
  # FIXME: the extra LDFLAG should not be needed;
  # this is a regression somewhere
  make LDFLAGS+=" -pthread" all
}

package() {
  cd "$srcdir/lilypond-$pkgver"
  make DESTDIR="$pkgdir/" \
       vimdir="/usr/share/vim/vimfiles" install

  rm -rf "$pkgdir/usr/share/man"
}
