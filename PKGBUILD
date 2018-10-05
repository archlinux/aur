# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stephen Caraher <moskvax@gmail.com>
# Contributor: Jon Gjengset <jon@tsp.io>

pkgname=gnuplot-git
pkgver=5.3r20181003.10584
pkgrel=1
pkgdesc="A command-line driven interactive function and data plotting utility -- inofficial github fork"
arch=('i686' 'x86_64')
url="https://github.com/gnuplot/gnuplot"
license=('custom')
depends=('gd' 'lua' 'qt5-svg' 'pango')
makedepends=('git' 'qt5-tools')
provides=('gnuplot=5.3')
conflicts=('gnuplot')
source=('git+https://git.code.sf.net/p/gnuplot/gnuplot-main' lua53_compat.patch)
sha256sums=('SKIP'
            'bfd8a61abbf4491c74225cb9fd252619d4fc29751838bcb4c0639ffe05a00695')
options=('!makeflags')
_gitname="gnuplot-main"

pkgver() {
  cd $_gitname
  printf "5.3r%s.%s" $(git log -1 --format="%cd" --date=short | tr -d '-') \
	 "$(git rev-list --count HEAD)"
}

prepare() {
  cd $_gitname
  patch -p1 < "$srcdir"/lua53_compat.patch
  sed -i 's+-fPIE+-fPIC+' configure.ac
  # fix default source location; use the GDFONTPATH variable 
  # to modify at runtime 
  sed -i 's|/usr/X11R6/lib/X11/fonts/truetype|/usr/share/fonts/TTF|' \
    src/variable.c
  sed -i 's|/X11R6/lib/X11/fonts/Type1|/usr/share/fonts/Type1|' \
    src/variable.c
}  

build() {
  cd $_gitname
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
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install

  install -Dm644 Copyright "$pkgdir"/usr/share/licenses/$pkgname/Copyright
}
