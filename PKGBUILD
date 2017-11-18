# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.3r20171118.e774a7dc8
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility -- inofficial github fork"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'lua' 'qt5-svg' 'pango')
makedepends=('git' 'emacs' 'texlive-core' 'texlive-latexextra' 'qt5-tools')
provides=('gnuplot=5.3')
conflicts=('gnuplot')
source=('gnuplot::git+https://git.code.sf.net/p/gnuplot/git-trunk' lua53_compat.patch)
md5sums=('SKIP'
         'c84be2980e0d90037f20a5cf18f9868a')
options=('!makeflags')
_gitname="gnuplot"

pkgver() {
  cd $srcdir/$_gitname
  printf "5.3r%s.%s" $(git log -1 --format="%cd" --date=short | tr -d '-') "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  patch -p1 < $srcdir/lua53_compat.patch
  sed -i 's+-fPIE+-fPIC+' configure.ac
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
    src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
    src/variable.c
}  

build() {
  cd "$srcdir/$_gitname"
  ./prepare
  TERMLIBS='-lX11' ./configure --prefix=/usr \
	  --libexecdir=/usr/lib \
	  --with-gihdir=/usr/share/gnuplot \
	  --with-texdir=/usr/share/texmf \
	  --with-readline=gnu \
	  --disable-wxwidgets \
	  --without-libcerf \
	  --with-qt=qt5 
	  
  make pkglibexecdir=/usr/bin
  cd docs
  make info
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  install -Dm644 Copyright \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
  install -Dm644 docs/gnuplot.info \
	  "$pkgdir/usr/share/info/gnuplot.info"
}
