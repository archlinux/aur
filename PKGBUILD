# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# if you switch from freetype2 from [extra] to freetype2-infinality-ultimate,
# delete the $srcdir directory before building

pkgname=lilypond-git
pkgver=2.21.r29070.28b894cb8d
pkgrel=1
pkgdesc="An automated music engraving system (Git snapshot)"
arch=('i686' 'x86_64')
url="http://lilypond.org/"
license=('GPL')
depends=('guile'
	 'pango'
	 'fontconfig'
	 'freetype2'
	 'python-lxml')
makedepends=('fontforge'
	     'git'
	     'gsfonts'
	     't1utils'
	     'dblatex'
	     'tex-gyre-fonts'
	     'texlive-langcyrillic'
	     'texi2html'
	     'netpbm')
optdepends=('extractpdfmark: for reducing the size of pdf output significantly'
	    'tidy: same for HTML files'
	    'tk: for the gui')
provides=('lilypond')
conflicts=('lilypond')
source=(git://git.savannah.gnu.org/lilypond.git#commit=28b894cb8d121eb7f531e193d1736b99fe593edf)
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd lilypond/
  printf %s.%s.r%s.%s $(grep MAJOR VERSION | cut -d= -f2) \
	 $(grep MINOR VERSION | cut -d= -f2) $(git rev-list --count HEAD) \
	 "$(git rev-parse --short HEAD)"
}

build() {
  cd lilypond/
  [[ -f config.hh ]] && rm config.hh
  ./autogen.sh --noconfigure
  [[ -d build ]] || mkdir build
  cd build
  ../configure --prefix=/usr \
      --disable-documentation
  make -j1 
}

package() {
  cd lilypond/build
  make DESTDIR="$pkgdir/" vimdir="/usr/share/vim/vimfiles" install
  rm -rf "$pkgdir"/usr/share/man
}
