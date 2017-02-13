# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=maxima-git
pkgver=5.39.1.100.ga26940732
pkgrel=1
pkgdesc="a sophisticated computer algebra system - git-version"
arch=('i686' 'x86_64')
url="http://maxima.sourceforge.net"
license=('GPL')
depends=('sbcl' 'sh')
makedepends=('git' 'cl-ppcre' 'perl' 'python' 'texlive-core' 'texinfo')
optdepends=('gnuplot: plotting capabilities'
	    'rlwrap: readline support via /usr/bin/rmaxima'
	    'tk: graphical xmaxima interface')
provides=('maxima')
conflicts=('maxima')
options=('!makeflags' '!zipman')
source=('maxima::git://git.code.sf.net/p/maxima/code' 'maxima.desktop')
md5sums=('SKIP'
         '24aa81126fbb8b726854e5a80d4c2415')
_gitname="maxima"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's+[_-]+.+g' | sed 's+base+1+' | cut -c8- 
}

build() {
  cd "$srcdir/$_gitname"
  ./bootstrap
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --infodir=/usr/share/info  --libexecdir=/usr/lib \
    --enable-sbcl --with-default-lisp=sbcl
  make
}

package() {
  cd "$srcdir/$_gitname"
  _pkgver=$(git describe --always | sed 's+-+_+g')
  make DESTDIR="$pkgdir/" \
       emacsdir=/usr/share/emacs/site-lisp/maxima install  
  # install some freedesktop.org compatibility
  install -Dm644 ${srcdir}/maxima.desktop \
  	  ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
