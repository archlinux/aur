# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=maxima-git
pkgver=5.47.1.363.g0ebda7220
pkgrel=1
pkgdesc="Sophisticated computer algebra system - git-version"
arch=('i686' 'x86_64')
url="http://maxima.sourceforge.net"
license=('GPL')
depends=('sbcl' 'sh' 'shared-mime-info')
makedepends=('git' 'perl' 'python' 'texlive-basic' 'texinfo')
optdepends=('gnuplot: plotting capabilities'
	    'rlwrap: readline support via /usr/bin/rmaxima'
	    'tk: graphical xmaxima interface')
provides=('maxima')
conflicts=('maxima')
options=('!makeflags' '!zipman')
source=('maxima::git://git.code.sf.net/p/maxima/code' 'maxima.desktop')
sha256sums=('SKIP'
            'd7ba38d5f35a6322b569e33a132eecf2fba36d4bc124ba75caa8e57f81753c20')

pkgver() {
  cd ${pkgname%-git}
  git describe --always | sed 's+[_-]+.+g' | sed 's+base+1+' | cut -c8- 
}

build() {
  cd ${pkgname%-git}
  ./bootstrap
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --infodir=/usr/share/info  --libexecdir=/usr/lib \
    --enable-sbcl --with-default-lisp=sbcl
  make
}

package() {
  cd ${pkgname%-git}
  _pkgver=$(git describe --always | sed 's+-+_+g')
  make DESTDIR="$pkgdir" \
       emacsdir=/usr/share/emacs/site-lisp/maxima install  
  install -Dm644 "$srcdir"/maxima.desktop \
  	  "$pkgdir"/usr/share/applications/${pkgname}.desktop
}
