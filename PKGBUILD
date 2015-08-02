# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.1r20150801.92e2067
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility -- inofficial github fork"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'qt5-svg' 'lua' 'wxgtk')
makedepends=('git' 'emacs' 'texlive-core' 'texlive-latexextra' 'qtchooser' 'qt5-tools')
provides=('gnuplot=5.1')
conflicts=('gnuplot')
install=gnuplot.install
source=('git://github.com/gnuplot/gnuplot.git' lua53_compat.patch)
md5sums=('SKIP' 'c84be2980e0d90037f20a5cf18f9868a')
options=('!makeflags')
_gitname="gnuplot"

pkgver() {
  cd $srcdir/$_gitname
  printf "5.1r%s.%s" $(git log -1 --format="%cd" --date=short | tr -d '-') "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  mv configure.in configure.ac
  patch -p1 < $srcdir/lua53_compat.patch
  sed -i 's+-fPIE+-fPIC+' configure.ac 
}  

build() {
  cd "$srcdir/$_gitname"
  ./prepare
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
    src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
    src/variable.c

  TERMLIBS='-lX11' ./configure --prefix=/usr \
	  --libexecdir=/usr/bin \
	  --with-gihdir=/usr/share/gnuplot \
	  --with-readline=gnu \
	  --enable-wxwidgets --with-qt=qt5 
  make pkglibexecdir=/usr/bin
  cd docs
  make info
}

package() {
  cd "$srcdir/$_gitname"
  make pkglibexecdir=/usr/bin DESTDIR="$pkgdir" install

  install -Dm644 Copyright \
	  "$pkgdir/usr/share/licenses/$pkgname/Copyright"

  rm -f "$pkgdir/usr/share/texmf-dist/ls-R"
  install -Dm644 docs/gnuplot.info \
	  "$pkgdir/usr/share/info/gnuplot.info"
}
